# Generated by Django 2.1.5 on 2019-01-25 19:13

from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('ninjasAPI', '0005_wishlist'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='productcategory',
            options={'verbose_name': 'Product Category', 'verbose_name_plural': 'Product Categories'},
        ),
        migrations.AlterModelOptions(
            name='salesorder',
            options={'verbose_name': 'Order', 'verbose_name_plural': 'Orders'},
        ),
        migrations.AlterModelOptions(
            name='salesorderitem',
            options={'verbose_name': 'Item', 'verbose_name_plural': 'Items'},
        ),
        migrations.AlterField(
            model_name='product',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ninjasAPI.ProductCategory', verbose_name='Product Category'),
        ),
        migrations.AlterField(
            model_name='product',
            name='title',
            field=models.CharField(max_length=64, verbose_name='Product Name'),
        ),
        migrations.AlterField(
            model_name='salesorder',
            name='order_date',
            field=models.DateTimeField(default=django.utils.timezone.now, editable=False, verbose_name='order date'),
        ),
    ]