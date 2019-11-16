# Generated by Django 2.2.7 on 2019-11-16 10:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('junctionbackend', '0003_auto_20191115_2045'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=400, unique=True)),
                ('icon_url', models.CharField(max_length=400, null=True)),
            ],
            options={
                'db_table': 'junction_tag',
            },
        ),
        migrations.CreateModel(
            name='TrailTag',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('tag', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='junctionbackend.Tag')),
                ('trail', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='junctionbackend.Trail')),
            ],
            options={
                'db_table': 'junction_trail_tag',
            },
        ),
    ]