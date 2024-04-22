from django.urls import path
from .views import *
from knox import views as knox_views

urlpatterns = [
    path('api/register/', RegisterAPI.as_view(), name='register'),
    path('api/login/',LoginAPI.as_view(),name='login'),
    path('api/logout/',knox_views.LogoutView.as_view(),name='logout'),
    path('api/logout/',knox_views.LogoutAllView.as_view(),name='logoutall'),
    path('api/change-password/',ChangePasswordView.as_view(),name='change-password'),
    path('verify-otp/', VerifyOTP.as_view(), name='verify-otp'),
    path('request-reset-email/', RequestPasswordResetEmail.as_view(),name='request-reset-emai'),
    path('password-reset/<uidb64>/<token>/',PasswordTokenCheckAPI.as_view(),name='password-reset-confirm'),
    path('password-reset-complete/',SetNewPasswordAPIView.as_view(),name='password-reset-complete'),


]