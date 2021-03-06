# Generated by Django 2.2.7 on 2019-11-16 13:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('junctionbackend', '0006_question_slider'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='max_label',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='question',
            name='min_label',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='question',
            name='range_end',
            field=models.IntegerField(null=True),
        ),
        migrations.AddField(
            model_name='question',
            name='range_start',
            field=models.IntegerField(null=True),
        ),
    ]
