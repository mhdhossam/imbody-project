from rest_framework import status, generics,permissions
from rest_framework.views import APIView
from rest_framework.response import Response
from .serializers import*
from rest_framework.authtoken.serializers import AuthTokenSerializer
from django.contrib.auth import login
from django.core.exceptions import ObjectDoesNotExist
from rest_framework.permissions import IsAuthenticated
from knox.models import AuthToken
from knox.views import LoginView as KnoxLoginView
from .models import CustomUser
from.emails import*

class RegisterAPI(generics.GenericAPIView):
  serializer_class = RegisterSerializer

  def post(self,request,*args,**kwargs):
       serializer=self.get_serializer(data=request.data)
       serializer.is_valid(raise_exception=True)
       user=serializer.save()
       send_otp_via_email(serializer.data['email'])
       return Response({
          "user":UserSerializer(user,context=self.get_serializer_context()).data,
          "token": AuthToken.objects.create(user)[1],
          "message":'registeration successfull please check your email ',
          },status=status.HTTP_201_CREATED)
  
      
class VerifyOTP(APIView):
  def post(self,request):
   
      data=request.data
      serializer=VerfiyOTPSerializer(data=data)
      if serializer.is_valid():
        email=serializer.validated_data['email']
        otp=serializer.validated_data['otp']
        user=CustomUser.objects.filter(email=email)
        serializer.save()

        if not user.exists():
         return Response({
          'status':400,
          'message':'No User Found with this Email Id.',
          'data':'invalid email',

        })
        if user[0].otp !=otp:
           return Response({
            'status':400,
            'message':'Invalid OTP Please Try Again Later.' , 
           ' data':"Wrong OTP",
           })
        user=user.first()
        user.is_verfied=True
        send_welcome_email(serializer.data['email'])
        user.save()
        return Response({
          'status':200,
          'message':'account verified',
          'data':serializer.data,
        })
      return  Response({
            'status':400,
            'message':'something wrong' , 
           ' data':serializer.errors,
           })


   

  
class LoginAPI(KnoxLoginView):
   permission_classes=(permissions.AllowAny,)

   def post(self,request,format=None):
    serializer=AuthTokenSerializer(data=request.data)
    serializer.is_valid(raise_exception=True)
    user=serializer.validated_data['user']
    login(request,user)
    return super(LoginAPI,self).post(request,format=None)
   
   
class ChangePasswordView(generics.UpdateAPIView):
 serializer_class = ChangePasswordSerializer
 model=CustomUser
 permission_classes=(IsAuthenticated,)
 def  get_object(self, queryset=None):
   obj=self.request.user
   return obj
 def update(self, request, *args, **kwargs):
   self.object=self.get_object()
   serializer=self.get_serializer(data=request.data)
   if serializer.is_valid():
  
     if not self.object.check_password(serializer.data.get("old_password")):
       return Response({"old_password":["wrong password"]},status=status.HTTP_400_BAD_REQUEST)
     self.object.check_password(serializer.data.get("new_password"))
     self.object.save()
     response={
       'status':'success',
       'code':status.HTTP_200_OK,
       'message':'Password updated successfully',
       'data':[]
     }
     return Response(response)
   return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
 
class RequestPasswordResetEmail(generics.GenericAPIView):
   serializer_class = ResetPasswordEmailRequestSerializer
   def post(self,request):
    serializer=self.serializer_class(data=request.data)
    email=request.data['email']
    absurl = ''
    if CustomUser.objects.filter(email=email).exists():
        user=CustomUser.objects.get(email=email) 
        uidb64=urlsafe_base64_encode(smart_bytes(user.id))
        token=PasswordResetTokenGenerator().make_token(user)                             
        current_site=get_current_site(
            request=request).domain
        relativeLink=reverse('password-reset-confirm',
                             kwargs={'uidb64':uidb64,'token':token})              
        absurl='http://'+ current_site+relativeLink
    subject='Reset your password'
    message=f"Dear User,click here to reset your password {absurl}"
    email_from= settings.EMAIL_HOST
    send_mail(subject,message,email_from,[email]) 
    user_obj=CustomUser.objects.get(email=email)
    user_obj.save()
    return Response({
        'success':'we have sent a link to resest your password please check your email'},
        status=status.HTTP_200_OK)
     
class PasswordTokenCheckAPI(generics.GenericAPIView):
  def get(self,request,uidb64,token):
    try :
      id=smart_str(urlsafe_base64_decode(uidb64))
      user=CustomUser.objects.get(id=id)
      if not PasswordResetTokenGenerator().check_token(user,token):
        return Response({'error':'This is an invalid or expired URL.'},
                        status=status.HTTP_401_UNAUTHORIZED)
      return Response({'success':True,
                       'message':'credentials valid',
                       'uidb64':uidb64,
                       'token':token},
                       status=status.HTTP_200_OK)

      
    except DjangoUnicodeDecodeError as identifier:
      return Response({'error':'There was an error decoding the URL.'},
                      status=status.HTTP_400_BAD_REQUEST)
      
class SetNewPasswordAPIView(generics.GenericAPIView):
  serializer_class=SetNewPasswordSerializer
  def patch(self,request):
    serializer=self.serializer_class(data=request.data)
    serializer.is_valid(raise_exception=True)
    return Response({'success':True,
                     'message':'password reset success'},
                     status=status.HTTP_200_OK)
