
import os
from pathlib import Path
from datetime import timedelta
from decouple import config
from rest_framework.settings import api_settings

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = os.environ.get('SECRET_KEY')

# SECURITY WARNING: don't run with debug turned on in production!
SECURE_SSL_REDIRECT = True
SSL_ON = True
SSL_REDIRECT_STATUS = 302  # or 301
SSL_CERTIFICATE = 'C:/Users/mhd_gamer/localhost.crt'
SSL_KEY = 'C:/Users/mhd_gamer/localhost.key'

DEBUG = True

ALLOWED_HOSTS = ['localhost', '127.0.0.1']

CORS_ALLOWED_ORIGINS = [
    "http://localhost:5173",
      "https://localhost:5173",  # Add your frontend URL here
    # Add more allowed origins as needed
]

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'user',
    'knox',
    # 'dj_rest_auth',
    # 'rest_framework_simplejwt',
    'rest_framework.authtoken',
    'rest_framework',
    'django_celery_results',
    'corsheaders',
    'sslserver',
    'debug_toolbar',


    

]
DEBUG_TOOLBAR_CONFIG = {
    'SHOW_TOOLBAR_CALLBACK': lambda request: True,
    'SQL_WARNING_THRESHOLD': 100,  # Adjust as needed
    'RESULTS_CACHE_SIZE': 3,
    'RESULTS_STORE_SIZE': 100,
    'DISABLE_PANELS': {
        'debug_toolbar.panels.redirects.RedirectsPanel',
    },
}
# settings.py

# 


MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.middleware.common.CommonMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

WSGI_APPLICATION = 'graduation.wsgi.application'

ROOT_URLCONF = 'graduation.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]




# Database
# https://docs.djangoproject.com/en/5.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
       'NAME': config('DATABASE_NAME'),
        'USER': config('DATABASE_USER'),
        'PASSWORD': config('DATABASE_PASSWORD'),
        'HOST': config('DATABASE_HOST'),
        'PORT': config('DATABASE_PORT', default=''), 
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.0/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.0/howto/static-files/

STATIC_URL = 'static/'
STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
STATICFILES_STORAGE = "whitenoise.storage.CompressedManifestStaticFilesStorage"
# Default primary key field type
# https://docs.djangoproject.com/en/5.0/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'
CELERY_BROKER_URL = config('CELERY_BROKER_URL') 
CELERY_RESULT_BACKEND = config('CELERY_RESULT_BACKEND') 
CELERY_ACCEPT_CONTENT = ['application/json']
CELERY_RESULT_SERIALIZER = 'json'
CELERY_TASK_SERIALIZER = 'json'
CELERY_STORE_ERRORS_EVEN_IF_IGNORED = True


REST_FRAMEWORK = {
    
    
    'DEFAULT_AUTHENTICATION_CLASSES': (
               
        # 'rest_framework.authentication.TokenAuthentication',   
        # 'rest_framework.authentication.SessionAuthentication',
        # 'rest_framework_simplejwt.authentication.JWTAuthentication',
        'knox.auth.TokenAuthentication',
        
           


    )
    
}

AUTH_USER_MODEL= os.environ.get('AUTH_USER_MODEL') 

EMAIL_USE_TLS = True  
EMAIL_HOST = config('EMAIL_HOST')  
EMAIL_HOST_USER = config('EMAIL_HOST_USER')   #server email
EMAIL_HOST_PASSWORD = config('EMAIL_HOST_PASSWORD')   
EMAIL_PORT = config('EMAIL_PORT')   


AUTHENTICATION_BACKENDS = [
    'django.contrib.auth.backends.ModelBackend',
]


# REST_KNOX = {
#     'SECURE_HASH_ALGORITHM':'cryptography.hazmat.primitives.hashes.SHA512',
#     'AUTH_TOKEN_CHARACTER_LENGTH': 64, # By default, it is set to 64 characters (this shouldn't need changing).
#     'TOKEN_TTL': timedelta(minutes=45), # The default is 10 hours i.e., timedelta(hours=10)).
#     'USER_SERIALIZER': 'knox.serializers.UserSerializer',
#     'TOKEN_LIMIT_PER_USER': None, # By default, this option is disabled and set to None -- thus no limit.
#     'AUTO_REFRESH': False, # This defines if the token expiry time is extended by TOKEN_TTL each time the token is used.
#     'EXPIRY_DATETIME_FORMAT': api_settings.DATETIME_FORMAT,
# }