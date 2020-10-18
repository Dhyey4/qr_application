import logging
from django.contrib.auth import authenticate, login, logout
from django.core.files.storage import FileSystemStorage
from django.shortcuts import render, redirect
from django.views.generic import TemplateView, RedirectView
from rest_framework import status
from rest_framework.permissions import AllowAny, IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from face_auth.models import *

logger = logging.getLogger(__name__)


class LogIn(TemplateView):
    template_name = "login.html"

    def post(self, request):
        email = request.POST.get('email')
        password = request.POST.get('password')
        user = authenticate(request, username=email, password=password)
        context = {}
        if user is not None:
            if not user.is_active:
                context['msg'] = "User is not Active! Contact To Admin!"
                context['type'] = "danger"
                return render(request, "login.html", context=context)
            login(request, user)
            return redirect('face_auth:index')
        context['msg'] = "No User found with this Username!!"
        context['type'] = "danger"
        return render(request, "login.html", context=context)


class LogOut(RedirectView):
    url = '/'

    def get(self, request, *args, **kwargs):
        logout(request)
        return super(LogOut, self).get(request, *args, **kwargs)


class Index(TemplateView):
    template_name = 'index.html'

    def get_context_data(self, **kwargs):
        context={}
        qrdata = QRCODE.objects.filter(qr_text='qrtest')[0]
        # for qr in qrdata:
        #     context[qr.qr_text] = qr.counter
        context['counter'] = qrdata.counter
        return context


class LogInAPI(APIView):
    permission_classes = (AllowAny,)

    def post(self, request):
        email = request.POST.get('email')
        password = request.POST.get('password')
        if email is None:
            return Response({"status": False, "code": 401, "message": "Employe ID is required to log in"})
        if password is None:
            return Response({"status": False, "code": 401, "message": "Password address is required to log in"})
        user = authenticate(username=email, password=password)
        print(user)
        if user is None:
            return Response({"status": False, "code": 401, "message": "User with this Email and password was not found"})
        return Response({"status": True, "code": 200,
                         "data": {'id': user.id, 'username': user.username, 'email': user.email,
                                  "profile_photo": user.get_profile_image, "city": user.city, "state": user.state,
                                  "zipcode": user.zipcode, "address": user.address, "phone": user.phone},
                         'token': user.token},
                        status=status.HTTP_200_OK)


class RegisterAPI(APIView):
    permission_classes = (AllowAny,)

    def post(self, request):
        email = request.POST.get('email')
        password = request.POST.get('password')
        username = request.POST.get('username')
        phone = request.POST.get('phone')
        state = request.POST.get('state')
        city = request.POST.get('city')
        zipcode = request.POST.get('zipcode')
        address = request.POST.get('address')
        check = User.objects.filter(email=email)
        if len(check) > 0:
            return Response({"status": False, "code": 401, "message": "Email is already registered"})
        if email is None:
            return Response({"status": False, "code": 401, "message": "Email is required for register"})
        if password is None:
            return Response({"status": False, "code": 401, "message": "Password address is required for register"})
        user = User.objects.create_user(email=email, password=password, username=username, phone=phone, city=city, state=state,
                                zipcode=zipcode, address=address)
        print(password)
        user.set_password(password)
        user.save()
        return Response({"status": True, "code": 200,
                         "data": {'id': user.id, 'username': user.username, 'email': user.email,
                                  "profile_photo": user.get_profile_image, "city": user.city, "state": user.state,
                                  "zipcode": user.zipcode, "address": user.address, "phone": user.phone},
                         'token': user.token},
                        status=status.HTTP_200_OK)


class ProfileAPI(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        user = request.user
        return Response({"status": True, "code": 200,
                         "user":{'id': user.id, 'username': user.username, 'email': user.email,
                                 "profile_photo": user.get_profile_image, "city": user.city, "state": user.state,
                                 "zipcode": user.zipcode, "address": user.address, "phone": user.phone
                                 }}, status=status.HTTP_200_OK)

    def post(self, request):
        user = request.user
        email = request.POST.get('email')
        password = request.POST.get('password')
        username = request.POST.get('username')
        phone = request.POST.get('phone')
        state = request.POST.get('state')
        city = request.POST.get('city')
        zipcode = request.POST.get('zipcode')
        address = request.POST.get('address')
        try:
            video_file = request.FILES['profile_img']
            fs = FileSystemStorage()
            filename = fs.save(video_file.name, video_file)
            uploaded_file_url = fs.url(filename)
            user.profile_image = uploaded_file_url
            user.save()
        except Exception as e:
            pass
        user.email = email
        user.password = password
        user.username = username
        user.phone = phone
        user.state = state
        user.city = city
        user.zipcode = zipcode
        user.address = address
        user.save()
        return Response({"status": True, "code": 200, "msg": "Profile Updated Successfully",
                         "user":{'id': user.id, 'username': user.username, 'email': user.email, 'work_location': user.worklocation_list,
                                 "shift": user.shift_list, "is_retrain": user.is_reupload, "is_request_accepted": user.is_request_accepted,
                                 "profile_photo": user.get_profile_image, "is_duplicate": user.is_duplicate
                                 }}, status=status.HTTP_200_OK)


class QRCODEAPI(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request, **kwargs):
        qrcode = kwargs['qr_code']
        qrdata = QRCODE.objects.filter(qr_text=qrcode)[0]
        qrdata.counter = qrdata.counter + 1
        qrdata.save()
        userdata, created_status = USERQR.objects.get_or_create(user=request.user, qrcode=qrdata)
        userdata.counter = userdata.counter + 1
        userdata.save()
        return Response({"status": True, "code": 200, "msg": "QR Code Scanned Successfully!!!"}, status=status.HTTP_200_OK)


class QRSTATUSAPI(APIView):
    permission_classes = (IsAuthenticated,)

    def get(self, request):
        qrdata = QRCODE.objects.filter(qr_text='qrtest')[0]
        userdata, created_status = USERQR.objects.get_or_create(user=request.user, qrcode=qrdata)

        return Response({"status": True, "code": 200,
                         "data": {"global": qrdata.counter, "local": userdata.counter}},
                        status=status.HTTP_200_OK)

