from datetime import datetime, timedelta
from enum import Enum

import jwt
from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin
)
from django.db import models
from website.settings import base as settings
from django.contrib.postgres.fields import ArrayField

from website.settings.base import BASE_URL
from django.utils import timezone

class UserManager(BaseUserManager):

    def _create_user(self, email, password, is_staff, is_superuser, **extra_fields):
        if not email:
            raise ValueError('Users must have an email address')
        now = timezone.now()
        email = self.normalize_email(email)
        user = self.model(
            email=email,
            is_staff=is_staff,
            is_active=True,
            is_superuser=is_superuser,
            last_login=now,
            created_at=now,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, email=None, password=None, **extra_fields):
        return self._create_user(email, password, False, False, **extra_fields)

    def create_superuser(self, email, password, **extra_fields):
        user = self._create_user(email, password, True, True, **extra_fields)
        user.save(using=self._db)
        return user

    def create_employ(self, password, email, **extra_fields):
        user = self._create_user(email, password, False, False, **extra_fields)
        user.save(using=self._db)
        return user


class User(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(db_index=True, max_length=255)
    email = models.EmailField(db_index=True, unique=True)
    is_login = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    profile_image = models.CharField(max_length=100, default="/media/face.jpeg", null=True)
    address = models.CharField(max_length=250, default=None, null=True)
    city = models.CharField(max_length=25, default=None, null=True)
    state = models.CharField(max_length=25, default=None, null=True)
    zipcode = models.CharField(max_length=10, default=None, null=True)
    phone = models.CharField(max_length=15, default=None, null=True)


    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']
    # objects of this type.
    objects = UserManager()

    def __str__(self):
        return self.email

    @property
    def token(self):
        return self._generate_jwt_token()

    def get_full_name(self):
        return self.username

    def get_short_name(self):
        return self.username

    @property
    def get_profile_image(self):
        if not self.profile_image:
            return None
        return BASE_URL+self.profile_image

    def _generate_jwt_token(self):
        dt = datetime.now() + timedelta(days=60)
        token = jwt.encode({
            'id': self.pk,
            'exp': int(dt.strftime('%s'))
        }, settings.SECRET_KEY, algorithm='HS256')
        return token.decode('utf-8')


class QRCODE(models.Model):
    created_date = models.DateTimeField(auto_now_add=True)
    qr_text = models.CharField(max_length=20, default='QRCODE')
    counter = models.BigIntegerField(default=0)


class USERQR(models.Model):
    user = models.ForeignKey(User, on_delete=models.SET_NULL, null=True)
    qrcode = models.ForeignKey(QRCODE, on_delete=models.SET_NULL, null=True)
    counter = models.BigIntegerField(default=0, null=True)