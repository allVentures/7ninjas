# Generated by Django 2.1.5 on 2019-01-23 16:50

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('ninjasAPI', '0003_remove_salesorder_sales_order_number'),
    ]

    operations = [
        migrations.AddField(
            model_name='salesorder',
            name='order_date',
            field=models.DateTimeField(default=django.utils.timezone.now, editable=False),
        ),
    ]