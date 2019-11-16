from rest_framework import serializers
from junctionbackend.models import NationalPark, Tag, Question


class NationalParkSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    national_park_code = serializers.IntegerField()

    class Meta:
        model = NationalPark
        fields = '__all__'


class TagSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    icon_url = serializers.CharField()

    class Meta:
        model = Tag
        fields = '__all__'


class QuestionSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    question = serializers.CharField()
    slider = serializers.BooleanField()

    class Meta:
        model = Question
        fields = '__all__'
