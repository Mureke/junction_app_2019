from django.db import models
from django.contrib.gis.db import models


class ParkVisits(models.Model):
    start_time = models.DateTimeField(null=False, blank=False)
    end_time = models.DateTimeField(null=False, blank=False)
    visits = models.IntegerField(null=False, default=0)
    trail = models.ForeignKey('Trail', on_delete=models.CASCADE)

    class Meta:
        db_table = 'junction_park_visitors'


class Trail(models.Model):
    counter_id_asta = models.CharField(max_length=250, null=False, blank=False)
    name = models.CharField(max_length=300, unique=True)
    location = models.PointField(null=False)
    national_park = models.ForeignKey('NationalPark', on_delete=models.CASCADE)

    class Meta:
        db_table = 'junction_counter'


class TrailTag(models.Model):
    trail = models.ForeignKey('Trail', on_delete=models.CASCADE)
    tag = models.ForeignKey('Tag', on_delete=models.CASCADE)

    class Meta:
        db_table = 'junction_trail_tag'


class Tag(models.Model):
    name = models.CharField(max_length=400, unique=True)
    icon_url = models.CharField(max_length=400, null=True, blank=False)

    class Meta:
        db_table = 'junction_tag'


class TrailQuestion(models.Model):
    trail = models.ForeignKey('Trail', on_delete=models.CASCADE)
    tag = models.ForeignKey('Question', on_delete=models.CASCADE)

    class Meta:
        db_table = 'junction_trail_question'


class Question(models.Model):
    question = models.CharField(max_length=900, unique=True)
    slider = models.BooleanField(default=False)  # Frontend stuff :)

    class Meta:
        db_table = 'junction_question'


class NationalPark(models.Model):
    national_park_code = models.IntegerField()
    name = models.CharField(max_length=300)

    class Meta:
        db_table = 'junction_national_park'
