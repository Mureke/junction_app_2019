from .settings import *

STATIC_URL = '/static/'
STATIC_ROOT = '/static/'
DATABASES = {
    'default': {
        'ENGINE': 'django.contrib.gis.db.backends.postgis',
        'NAME': 'junction',
        'USER': 'junction_man',
        'PASSWORD': 'pass',
        'HOST': '172.17.0.1',
        'PORT': 9876,
    }
}

