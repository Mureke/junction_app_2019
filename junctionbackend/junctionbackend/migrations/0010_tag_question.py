# Generated by Django 2.2.7 on 2019-11-16 14:22

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('junctionbackend', '0009_auto_20191116_1336'),
    ]

    operations = [
        migrations.AddField(
            model_name='tag',
            name='question',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='junctionbackend.Question'),
        ),
    ]