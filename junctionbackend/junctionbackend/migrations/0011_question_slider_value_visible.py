# Generated by Django 2.2.7 on 2019-11-16 15:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('junctionbackend', '0010_tag_question'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='slider_value_visible',
            field=models.BooleanField(default=False),
        ),
    ]
