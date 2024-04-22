from rest_framework import serializers
from .models import CustomUser
from random import randint
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import smart_str,force_str,smart_bytes,DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode,urlsafe_base64_encode
from django.urls import reverse
from django.contrib.sites.shortcuts import get_current_site


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = ['id','email','password']
        

           
            
class RegisterSerializer(serializers.ModelSerializer):
    class Meta:

        model=CustomUser
        fields=['id','email','password']
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        user = CustomUser.objects.create_user(
           
            email=validated_data['email'],
            password=validated_data['password'],
        )
        user.save()
        return user
    
class ChangePasswordSerializer(serializers.ModelSerializer):
    class Meta:
     
     model=CustomUser
     fields=['old_password','new_password']

    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)


class VerfiyOTPSerializer(serializers.Serializer):
    class Meta:

        model = CustomUser
        fields = ['email','otp']
        
    email = serializers.EmailField()
    otp = serializers.CharField()

    def create(self, validated_data):
        user = CustomUser.objects.get(
            email=validated_data['email'],
        )
        user.otp = validated_data['otp']
        user.save()
        return user

class ResetPasswordEmailRequestSerializer(serializers.Serializer):
    email = serializers.EmailField()
    class Meta:

        model = CustomUser
        fields = ['email']
        
class SetNewPasswordSerializer(serializers.Serializer):
    password=serializers.CharField(write_only=True)
    token=serializers.CharField(write_only=True)
    uidb64=serializers.CharField(write_only=True)
    
    class Meta:
        fields=['password','token','uidb64']
    
    def validate(self, attrs):
        password=attrs.get('password')
        token=attrs.get('token')
        uidb64=attrs.get('uidb64')
        
        # Call the parent class's validate method
        attrs = super().validate(attrs)
        
        try:
            id=force_str(urlsafe_base64_decode(uidb64))
            user=CustomUser.objects.get(id=id)
            
            if not PasswordResetTokenGenerator().check_token(user,token):
                raise serializers.ValidationError("Invalid or expired link",401)
            
            user.set_password(password)
            user.save()
            
            # Return the validated attributes
            return attrs
        
        except Exception as e:
            raise serializers.ValidationError("Invalid or expired link",401)
        