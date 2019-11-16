from django.core.management.base import BaseCommand
import logging
import csv
from django.db.utils import IntegrityError
from junctionbackend.models import ParkVisits, Trail, NationalPark
import datetime
from junctionbackend.utils import geo_converter
from django.contrib.gis.geos.point import Point
from django.db.transaction import atomic

PARK_NAMES = {
    "852": 'Nuuksio National Park',
    "34361": 'Pallas-Yllästunturi National Park'
}

TRAILS = {
    "1099": {
        "name": "Varkaankuru",
        "location": geo_converter.convert_espg3067(7500782, 381166),
        "national_park_id": "34361"
    }
}


class Command(BaseCommand):
    help = "Parse Data"

    def add_arguments(self, parser):
        parser.add_argument(
            '--file', dest='csv', required=True,
            help='Upload a csv for parsing to conditions_translations'
        )

    def handle(self, *args, **options):
        new_entries = 0
        skipped_entries = 0

        try:
            with open(options['csv']) as f:
                reader = csv.DictReader(f, dialect=CustomDialect)
                counter = 0
                for row in reader:
                    counter += 1
                    print(counter)

                    try:
                        national_park = NationalPark.objects.get_or_create(national_park_code=row['ASTA_Counters.NationalParkCode'], name=PARK_NAMES[row['ASTA_Counters.NationalParkCode']])
                        lat, long = geo_converter.convert_espg3067(row['PAVE_Counters.CoordinateNorth'], row['PAVE_Counters.CoordinateEast'])
                        trail = Trail.objects.get_or_create(counter_id_asta=row['CounterID_ASTA'], name=row['ASTA_Counters.Name_ASTA'],
                                                            location=Point(x=lat, y=long),
                                                            national_park=national_park[0])
                        start_date = datetime.datetime.strptime(row['StartTime'], '%d/%m/%Y %H:%M')
                        end_date = datetime.datetime.strptime(row['StartTime'], '%d/%m/%Y %H:%M')
                        park_visit = ParkVisits(start_time=start_date, end_time=end_date, visits=row['Visits'], trail=trail[0])
                        park_visit.save()
                        new_entries += 1

                    except IntegrityError:
                        logging.info("Duplicate entry, skipping")
                        skipped_entries += 1
                        continue

                    except Exception as e:
                        continue

        except FileNotFoundError:
            logging.error("File not found:" + options['csv'])
            print("Please input a file that exists")
            exit(0)

        print("Added " + str(new_entries) + " new entries. Skipped " + str(skipped_entries) + " existing entries")


class CustomDialect(csv.Dialect):
    delimiter = ';'
    quotechar = '"'
    doublequote = True
    skipinitialspace = False
    lineterminator = '\n'
    quoting = csv.QUOTE_ALL


csv.register_dialect("custom", CustomDialect)
