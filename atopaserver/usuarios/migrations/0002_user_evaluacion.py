# Generated by Django 3.0.6 on 2020-05-26 14:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('usuarios', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='user',
            name='evaluacion',
            field=models.BooleanField(default=False),
        ),
    ]
