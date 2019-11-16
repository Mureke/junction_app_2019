from django.contrib import admin
from django.forms import ModelForm, CharField, URLField
from junctionbackend.models import Tag, Question, Trail, TrailQuestion, TrailTag


class TagForm(ModelForm):
    name = CharField(required=True)
    icon_url = CharField(required=False)


class TagAdmin(admin.ModelAdmin):
    form = TagForm
    list_display = ('name',)


class QuestionAdmin(admin.ModelAdmin):
    list_display = ('question',)


class TrailTagInline(admin.TabularInline):
    model = TrailTag
    extra = 0


class TrailQuestionInline(admin.TabularInline):
    model = TrailQuestion
    extra = 0

class TrailAdmin(admin.ModelAdmin):
    inlines = [TrailQuestionInline, TrailTagInline]
    list_display = ('name',)
    exclude = ('location', )


admin.site.register(Tag, TagAdmin)
admin.site.register(Question, QuestionAdmin)
admin.site.register(Trail, TrailAdmin)
