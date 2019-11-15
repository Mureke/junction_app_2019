from django.core.management.base import BaseCommand
import logging
import csv
from django.db.utils import IntegrityError
from junctionbackend.models import ParkVisits, Trail, NationalPark


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
                        counter = Trail.objects.filter(counter_id_asta=row['CounterID_ASTA']).first()
                        park_visit = ParkVisits(start_time=row['StartTime'], end_time=row['EndTime'],
                                                visits=row['Visits'], counter=counter)
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

