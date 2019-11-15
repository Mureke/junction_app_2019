from django.core.management.base import BaseCommand
import logging
import csv
from django.db.utils import IntegrityError
from junctionbackend.models import ParkVisits, Trail, NationalPark
import datetime

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
                for row in reader:
                    try:
                        trail = Trail.objects.filter(counter_id_asta=row['CounterID_ASTA']).first()
                        start_date = datetime.datetime.strptime(row['StartTime'], '%d/%m/%Y %H:%M')
                        end_date = datetime.datetime.strptime(row['StartTime'], '%d/%m/%Y %H:%M')
                        park_visit = ParkVisits(start_time=start_date, end_time=end_date, visits=row['Visits'], trail=trail)
                        park_visit.save()
                        new_entries += 1

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

class CustomDialect(csv.Dialect):
    delimiter = ';'
    quotechar = '"'
    doublequote = True
    skipinitialspace = False
    lineterminator = '\n'
    quoting = csv.QUOTE_ALL


csv.register_dialect("custom", CustomDialect)

