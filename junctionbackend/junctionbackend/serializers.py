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

    min_label = serializers.CharField()
    max_label = serializers.CharField()

    range_length = serializers.IntegerField(required=False)

    class Meta:
        model = Question
        fields = '__all__'


class TrailSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    national_park = serializers.SerializerMethodField()
    location = serializers.SerializerMethodField()

    def get_location(self, obj):
        return {'lat': obj.location.x, 'long': obj.location.y}

    def get_national_park(self, obj):
        return NationalParkSerializer(obj.national_park).data

    class Meta:
        model = Tag
        fields = '__all__'
