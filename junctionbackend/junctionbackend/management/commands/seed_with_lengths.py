from django.core.management.base import BaseCommand
from random import Random
from junctionbackend.models import Trail


class Command(BaseCommand):

    def handle(self, *args, **options):
        r = Random()
        trails = Trail.objects.all()
        for trail in trails:
            trail.length = r.randrange(1, 50)
            trail.save()
