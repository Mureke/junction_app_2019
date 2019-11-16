from django.contrib import admin
from django.forms import ModelForm, CharField, URLField
from junctionbackend.models import Tag


class TagForm(ModelForm):
    name = CharField(required=True)
    icon_url = CharField(required=False)


class TagAdmin(admin.ModelAdmin):
    form = TagForm
    list_display = ('name', )


admin.site.register(Tag, TagAdmin)