from django.contrib.auth.decorators import login_required
from django.urls import path
from .views import *

app_name = 'face_auth'

urlpatterns = [
    path('login', LogIn.as_view(), name="login"),
    path('logout', LogOut.as_view(), name="logout"),
    path('', login_required(Index.as_view()), name='index'),
    path('demo', PLCdemo.as_view(), name='plcdemo'),

    path('api/login/', LogInAPI.as_view(), name='loginAPI'),
    path('api/register/', RegisterAPI.as_view(), name='registerAPI'),
    path('api/profile/', ProfileAPI.as_view(), name='profile'),
    path('api/qrcode/<qr_code>/', QRCODEAPI.as_view(), name='qrcode'),
    path('api/qrstatus/', QRSTATUSAPI.as_view(), name='qrstatus'),
    path('api/graph/', GraphAPI.as_view(), name='graphapi'),


]
# handler404 = 'face_auth.views.error_404'
# handler500 = 'face_auth.views.error_500'