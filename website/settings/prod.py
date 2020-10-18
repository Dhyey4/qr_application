from .base import *

BASE_URL = "https://epehchan.rcil.gov.in"
DEBUG = False
ALLOWED_HOSTS = ["epehchan.rcil.gov.in"]


# CSRF_COOKIE_HTTPONLY = True
# CSRF_COOKIE_SAMESITE = True
# CSRF_COOKIE_SECURE = True
# CSRF_COOKIE_SAMESITE = 'Strict'
# SESSION_COOKIE_SECURE = True
# SECURE_BROWSER_XSS_FILTER = True
# # SECURE_CONTENT_TYPE_NOSNIFF = True
# SECURE_SSL_REDIRECT = True
# SESSION_EXPIRE_AT_BROWSER_CLOSE = True
# # SECURE_HSTS_SECONDS = 31536000  # 1 year
# # SECURE_HSTS_INCLUDE_SUBDOMAINS = True
# # SECURE_HSTS_PRELOAD = True
# # X_FRAME_OPTIONS = 'DENY'
#
# SESSION_EXPIRE_AT_BROWSER_CLOSE = True
# SESSION_COOKIE_AGE = 5 * 60
# SESSION_EXPIRE_SECONDS = 300  # 5 min
# SESSION_EXPIRE_AFTER_LAST_ACTIVITY = True
# SESSION_TIMEOUT_REDIRECT = 'face_auth:login'  # redirect to whatever page


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
    }
}