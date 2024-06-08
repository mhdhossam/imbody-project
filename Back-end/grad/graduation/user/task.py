from django.core.mail import send_mail
import random
from django.conf import settings
from.models import CustomUser
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import smart_str,force_str,smart_bytes,DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode,urlsafe_base64_encode
from django.urls import reverse
from django.contrib.sites.shortcuts import get_current_site
from celery import shared_task

def  send_otp_via_email(email):
    subject='Your account verification email'
    otp=random.randint(1000,9999)
    message=f"Dear User,\n\nPlease verify your account by entering the following OTP {otp}"
    email_from= settings.EMAIL_HOST
    send_mail(subject,message,email_from,[email])
    user_obj=CustomUser.objects.get(email=email)
    user_obj.otp=otp
    user_obj.save()

def send_welcome_email(email):
    subject='welcome to fit genie'
    message=f"Dear User,thanks for signing in our web"
    email_from= settings.EMAIL_HOST
    send_mail(subject,message,email_from,[email])
    user_obj=CustomUser.objects.get(email=email)
    user_obj.save()

     