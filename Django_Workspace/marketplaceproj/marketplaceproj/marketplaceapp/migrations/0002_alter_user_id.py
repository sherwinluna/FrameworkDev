# Generated by Django 3.2.25 on 2024-10-26 15:52

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('marketplaceapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='id',
            field=models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID'),
        ),
    ]