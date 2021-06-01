# Generated by Django 2.1.5 on 2019-01-24 09:55

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('ninjasAPI', '0004_salesorder_order_date'),
    ]

    operations = [
        migrations.CreateModel(
            name='WishList',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='customer')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ninjasAPI.Product', verbose_name='wanted_product')),
            ],
        ),
    ]