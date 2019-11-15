from django.core.management.base import BaseCommand
import logging
import csv
from django.db.utils import IntegrityError
from junctionbackend.models import Counter, NationalPark
from django.contrib.gis.geos.point import Point


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
                reader = csv.DictReader(f, dialect='excel')
                for row in reader:
                    try:
                        counter = Counter(counter_id_asta=row['CountID_ASTA'], name=row['ASTA_Counters.Name_ASTA'],
                                          location=Point(x=row['PAVE_Counters.CoordinateEast'], y=row['PAVE_Counters.CoordinateNorth']),
                                          national_park=NationalPark.object.filter(national_park_code=row['ASTA_Counters.NationalParkCode']))
                        counter.save()
                        new_entries += 1;

                    except IntegrityError:
                        logging.info("Duplicate entry, skipping")
                        skipped_entries += 1
                        continue

                    except TypeError as e:
                        logging.error("Invalid field names in CSV file." + str(e))
                        print("Invalid field names in CSV file!")
                        exit(0)

        except FileNotFoundError:
            logging.error("File not found:" + options['csv'])
            print("Please input a file that exists")
            exit(0)

        print("Added " + str(new_entries) + " new entries. Skipped " + str(skipped_entries) + " existing entries")


