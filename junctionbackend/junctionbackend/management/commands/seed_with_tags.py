from django.core.management.base import BaseCommand
from random import Random
from junctionbackend.models import Trail, Tag, TrailTag
import datetime
from junctionbackend.utils import geo_converter


def randomize_index(used_indexes, number_of_tags, r):
    while True:
        tag_index = r.randrange(number_of_tags)
        if tag_index not in used_indexes:
            return tag_index



class Command(BaseCommand):

    def handle(self, *args, **options):
        r = Random()
        trails = Trail.objects.all()
        tags = Tag.objects.all()
        number_of_tags = len(tags)
        for trail in trails:
            used_indexes = []
            tag_range = r.randrange(6)+1
            for i in range(tag_range):
                tag_index = randomize_index(used_indexes, number_of_tags, r)
                used_indexes.append(tag_index)
                trail_tag = TrailTag(trail=trail, tag=tags[tag_index])
                trail_tag.save()
                if len(used_indexes) >= number_of_tags:
                    break




