import os
from celery import Celery
# os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'quick_publisher.settings')
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'website.settings.prod')
 
app = Celery('website')
app.config_from_object('django.conf:settings')
 
# Load task modules from all registered Django app configs.
app.autodiscover_tasks()