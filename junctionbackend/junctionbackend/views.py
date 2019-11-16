from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework.viewsets import ReadOnlyModelViewSet
from rest_framework.decorators import api_view

from junctionbackend.models import NationalPark, Tag, Question, Trail, ParkVisits
from junctionbackend.serializers import NationalParkSerializer, TagSerializer, QuestionSerializer, TrailSerializer


class NationalParkViewSet(ReadOnlyModelViewSet):
    queryset = NationalPark.objects.all()
    serializer_class = NationalParkSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = NationalParkSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None, *args, **kwargs):
        queryset = self.get_queryset()
        obj = get_object_or_404(queryset, pk=pk)
        serializer = NationalParkSerializer(obj)
        return Response(serializer.data)


class TagViewSet(ReadOnlyModelViewSet):
    queryset = Tag.objects.all()
    
    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = TagSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None, *args, **kwargs):
        queryset = self.get_queryset()
        obj = get_object_or_404(queryset, pk=pk)
        serializer = TagSerializer(obj)
        return Response(serializer.data)


class QuestionViewSet(ReadOnlyModelViewSet):
    queryset = Question.objects.all().order_by('ordinal')

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = QuestionSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None, *args, **kwargs):
        queryset = self.get_queryset()
        obj = get_object_or_404(queryset, pk=pk)
        serializer = QuestionSerializer(obj)
        return Response(serializer.data)


class TrailViewSet(ReadOnlyModelViewSet):
    queryset = Trail.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = TrailSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None, *args, **kwargs):
        queryset = self.get_queryset()
        obj = get_object_or_404(queryset, pk=pk)
        serializer = TrailSerializer(obj)
        return Response(serializer.data)

    @api_view(['GET',])
    def matching_trails(self, park_id):
        trails = Trail.objects.all().filter(national_park_id=park_id)
        tag_ids = self.GET.get('tags', None)
        start_date = self.GET.get('start_date', None)
        end_date = self.GET.get('end_date', None)

        data = []
        if tag_ids:
            trails.filter(trailtag__tag_id__in=tag_ids.split(','))

        data.append(TrailSerializer(trails, many=True).data)

        response_data = []
        for trail in trails:
            trail_data = TrailSerializer(trail).data
            trail_data['visits'] = trail.get_visits(start_date, end_date)
            if trail_data['visits'] is None:
                trail_data['visits'] = 0.0
            response_data.append(trail_data)

        response_data = sorted(response_data, key=lambda k: k['visits'], reverse=False)

        return Response(response_data)
