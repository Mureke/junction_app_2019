from django.db import models
from django.contrib.gis.db import models


class ParkVisits(models.Model):
    start_time = models.DateTimeField(null=False, blank=False)
    end_time = models.DateTimeField(null=False, blank=False)
    visits = models.IntegerField(null=False, default=0)
    counter = models.ForeignKey('Counter', on_delete=models.CASCADE)

    class Meta:
        db_table = 'junction_park_visitors'


class Counter(models.Model):
    counter_id_asta = models.CharField(max_length=250, null=False, blank=False)
    name = models.CharField(max_length=300, unique=True)
    location = models.PointField(null=False)
    national_park_code = models.ForeignKey('NationalPark', on_delete=models.CASCADE)

    class Meta:
        db_table = 'junction_counter'


class NationalPark(models.Model):
    national_park_code = models.IntegerField()
    name = models.CharField(max_length=300)

    class Meta:
        db_table = 'junction_national_park'