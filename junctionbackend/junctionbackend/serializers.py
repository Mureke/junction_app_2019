from rest_framework import serializers
from junctionbackend.models import NationalPark, Tag, Question, TrailTag, Trail


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

    tags = serializers.SerializerMethodField()

    def get_tags(self, obj):
        tags = Tag.objects.filter(question=obj)
        return TagSerializer(tags, many=True).data

    class Meta:
        model = Question
        fields = '__all__'


class TrailSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField()
    name = serializers.CharField()
    national_park = serializers.SerializerMethodField()
    location = serializers.SerializerMethodField()
    tags = serializers.SerializerMethodField()

    def get_tags(self, obj: Tag):
        trail_tags = TrailTag.objects.filter(trail=obj).values_list('tag', flat=True)
        if trail_tags:
            tags = Tag.objects.filter(pk__in=set(list(trail_tags)))
            return TagSerializer(tags, many=True).data
        return None

    def get_location(self, obj):
        return {'lat': obj.location.x, 'long': obj.location.y}

    def get_national_park(self, obj):
        return NationalParkSerializer(obj.national_park).data

    class Meta:
        model = Trail
        fields = '__all__'
