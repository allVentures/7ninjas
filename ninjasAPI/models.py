from django.contrib.auth.models import User, AbstractUser
from django.db import models
from django.utils.timezone import now

CURRENCY = (
    (1, "PLN"),
    (2, "EUR"),
    (3, "USD"),
    (4, "GBP"),
)

# You probably need some more information about customers and extension of the User model (address etc.) , I'm gonna skip that as it wasn't
# specified in the excercise description

class Currency_Rates(models.Model):
    currency = models.IntegerField(choices=CURRENCY, default=1)
    currency_rate = models.FloatField()


class ProductCategory(models.Model):
    product_category = models.CharField(max_length=64, unique=True)

    def __str__(self):
        return "%s" % (self.product_category)


class Product(models.Model):
    title = models.CharField(max_length=64)
    description = models.TextField(max_length=512, null=True)
    price = models.FloatField()
    currency = models.IntegerField(choices=CURRENCY, default=1)
    category = models.ForeignKey(ProductCategory, on_delete=models.CASCADE, verbose_name="product_category")
    picture = models.ImageField(null=True)
    def __str__(self):
        return "%s" % (self.title)


class Delivery(models.Model):
    title = models.CharField(max_length=128)
    fixed_price_delivery = models.FloatField(null=True)
    percentage_delivery_price = models.FloatField(null=True)

    def __str__(self):
        return "%s" % (self.title)


# for simplification - SalesOrder.id to sales order number
class SalesOrder(models.Model):
    customer = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="customer")
    delivery = models.ForeignKey(Delivery, on_delete=models.CASCADE, verbose_name="delivery")
    order_date = models.DateTimeField(editable=False, default=now)


class SalesOrderItem(models.Model):
    sales_order_number = models.ForeignKey(SalesOrder, on_delete=models.CASCADE, verbose_name="order_number")
    product = models.ForeignKey(Product, on_delete=models.CASCADE, verbose_name="product")
    quantity = models.IntegerField()
