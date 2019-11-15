from django.core.management.base import BaseCommand
from pyproj import Proj, transform


class Command(BaseCommand):
    help = "Parse Data"

    def add_arguments(self, parser):
        pass

    def handle(self, *args, **options):
        inProj = Proj(init='epsg:3067')
        outProj = Proj(init='epsg:4326')
        x1, y1 = (7500782, 381166)
        print('Converting')

        x2, y2 = transform(inProj, outProj, x1, y1)
        print(x2, y2)
