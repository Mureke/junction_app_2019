from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework.viewsets import ReadOnlyModelViewSet

from junctionbackend.models import NationalPark
from junctionbackend.serializers import NationalParkSerializer


class NationalParkViewSet(ReadOnlyModelViewSet):
    queryset = NationalPark.objects.all()
    serializer_class = NationalParkSerializer

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        serializer = NationalParkSerializer(queryset, many=True)
        return Response(serializer.data)

    def retrieve(self, request, pk=None, *args, **kwargs):
        queryset = self.get_queryset()
        user = get_object_or_404(queryset, pk=pk)
        serializer = NationalParkSerializer(user)
        return Response(serializer.data)
