from django.contrib import admin
from django.urls import path
from rest_framework import routers
from django.conf.urls import url, include
from junctionbackend.views import NationalParkViewSet, TagViewSet, QuestionViewSet, TrailViewSet


api_router = routers.DefaultRouter()
api_router.register(r'national-park', NationalParkViewSet)
api_router.register(r'tag', TagViewSet)
api_router.register(r'question', QuestionViewSet)
api_router.register(r'trail', TrailViewSet)

api_urls = []
urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(api_router.urls, api_urls)),
]
