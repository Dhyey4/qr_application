# Generated by Django 2.2.12 on 2020-10-18 19:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('face_auth', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='username',
            field=models.CharField(db_index=True, max_length=255),
        ),
    ]
