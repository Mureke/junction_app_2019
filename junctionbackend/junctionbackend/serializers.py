from rest_framework import serializers
from junctionbackend.models import NationalPark


class NationalParkSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    national_park_code = serializers.IntegerField()

    class Meta:
        model = NationalPark
        fields = '__all__'
