from django.template.loader import render_to_string
from django.conf import settings
from website._celery import app
from django.core.mail import EmailMultiAlternatives

@app.task
def send_registration_email(username,pfnumber,password,useremail):
    subject = 'Welcome To Epehchan'
    text_content = render_to_string('email_template/registration.html', {
        'name': username,
        'password': password,
        'pfnumber': pfnumber,
    })
    html_content = render_to_string('email_template/registration.html', {
        'name': username,
        'password': password,
        'pfnumber': pfnumber,
    })
    msg = EmailMultiAlternatives(subject, text_content, settings.EMAIL_HOST_USER, [useremail])
    msg.attach_alternative(html_content, "text/html")
    msg.send()

@app.task
def send_trainingStatus_email(username, useremail, msg):
    subject = 'E-Pehchan Training Status'
    text_content = render_to_string('email_template/training_status.html', {
        'name': username,
        'msg': msg,
    })
    html_content = render_to_string('email_template/training_status.html', {
        'name': username,
        'msg': msg,
    })
    msg = EmailMultiAlternatives(subject, text_content, settings.EMAIL_HOST_USER, [useremail])
    msg.attach_alternative(html_content, "text/html")
    msg.send()\

@app.task
def send_support_email(username, email, msg):
    subject = 'New Complaint Raised By Customer'
    text_content = render_to_string('email_template/support.html', {
        'name': username,
        'email': email,
        'msg': msg,
    })
    html_content = render_to_string('email_template/support.html', {
        'name': username,
        'email': email,
        'msg': msg,
    })
    msg = EmailMultiAlternatives(subject, text_content, settings.EMAIL_HOST_USER, ['dhyey.bhanvadiya36@gmail.com'])
    msg.attach_alternative(html_content, "text/html")
    msg.send()