# Generated by Django 2.2.7 on 2019-11-15 20:45

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('junctionbackend', '0002_auto_20191115_2020'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Counter',
            new_name='Trail',
        ),
        migrations.RenameField(
            model_name='parkvisits',
            old_name='counter',
            new_name='trail',
        ),
    ]