from django.contrib import admin
from face_auth.models import *
# Register your models here.

admin.site.register(User)
admin.site.register(QRCODE)
admin.site.register(USERQR)