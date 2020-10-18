from django.core.management.base import BaseCommand, CommandError
from face_auth.models import *


class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def handle(self, *args, **options):
        data = [
                ['100003','Asstt. General Manager'],
                ['100004','Asstt. General Manager'],
                ['100005','Asstt. General Manager'],
                ['100007','Dy. General Manager'],
                ['100009','Dy. General Manager'],
                ['100014','Dy. General Manager'],
                ['100025','Dy. General Manager'],
                ['100038','Joint General Manager'],
                ['100040','Asstt. General Manager'],
                ['100041','Joint General Manager'],
                ['100050','Asstt. General Manager'],
                ['100106','Asstt. General Manager'],
                ['100110','Asstt. General Manager'],
                ['100123','Asstt. General Manager'],
                ['100135','Asstt. General Manager'],
                ['100139','Senior Manager'],
                ['100140','Senior Manager'],
                ['100147','Senior Manager'],
                ['100156','Senior Manager'],
                ['100173','Senior Manager'],
                ['100174','Manager'],
                ['100175','Senior Manager'],
                ['100176','Senior Manager'],
                ['100275','Dy. General Manager'],
                ['100289','Senior Manager'],
                ['100291','General Manager'],
                ['100304','Senior Manager'],
                ['100306','Senior Manager'],
                ['100309','Senior Manager'],
                ['100315','Dy. General Manager'],
                ['100316','Asstt. General Manager'],
                ['100317','Asstt. General Manager'],
                ['100318','Asstt. General Manager'],
                ['100322','Manager'],
                ['100324','Manager'],
                ['100326','Joint General Manager'],
                ['100328','Asstt. General Manager'],
                ['100365','Asstt. General Manager'],
                ['100366','Manager'],
                ['100367','Asstt. General Manager'],
                ['100376','Stenographer'],
                ['100379','Stenographer'],
                ['100382','Stenographer'],
                ['100383','Stenographer'],
                ['100384','Stenographer'],
                ['100386','Asstt. General Manager'],
                ['100397','Manager'],
                ['100398','Manager'],
                ['100399','Manager'],
                ['100400','Manager'],
                ['100405','Manager'],
                ['100417','General Manager'],
                ['100420','Manager'],
                ['100429','Manager'],
                ['100450','Stenographer'],
                ['100452','Dy. Manager'],
                ['100459','Dy. Manager'],
                ['100460','Dy. Manager'],
                ['100461','Senior Manager'],
                ['200063','Dy. General Manager'],
                ['200071','Executive Director'],
                ['200074','Joint General Manager'],
                ['200076','Dy. General Manager'],
                ['200079','Asstt. General Manager'],
                ['200085','Dy. General Manager'],
                ['200115','Senior Manager'],
                ['200123','Executive Director'],
                ['200135','Dy. General Manager'],
                ['200139','Executive Director'],
                ['200140','Senior Manager'],
                ['200146','Manager'],
                ['200152','Senior Manager'],
                ['300146','General Manager'],
                ['300149','General Manager'],
                ['400067','Addl. General Manager'],
                ['500173','Technical Lead'],
                ['500183','Technical Lead'],
                ['500184','Project Director'],
                ['500185','Project Manager'],
                ['700022','Advisor'],
                ['900023','Chairman and Managing Director'],]
        for row in data:
            User.objects.filter(pf_number=row[0]).update(designation=row[1])
        print("Updated Successfully!!!")