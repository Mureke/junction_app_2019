from django.core.management.base import BaseCommand
import logging
import csv
from django.db.utils import IntegrityError
import importlib


class Command(BaseCommand):
    help = "Parse Data"

    def add_arguments(self, parser):
        parser.add_argument(
            '--file', dest='csv', required=True,
            help='Upload a csv for parsing to conditions_translations'
        )
        parser.add_argument(
            '--table', dest='table', required=True,
            help="Define table in which inserts will be made"
        )

    def handle(self, *args, **options):
        new_entries = 0
        skipped_entries = 0
        TempClass = self.find_class(options['table'])

        try:
            with open(options['csv']) as f:
                reader = csv.DictReader(f, dialect=CustomDialect)
                for row in reader:
                    try:
                        p = TempClass(**row)
                        p.save()
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