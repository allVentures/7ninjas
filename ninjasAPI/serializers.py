from django.contrib.auth.models import User
from rest_framework import serializers

from ninjasAPI.models import Product, ProductCategory, CURRENCY, SalesOrder, SalesOrderItem, Delivery


class ProductSerializer(serializers.ModelSerializer):
    category = serializers.SlugRelatedField(many=False, slug_field='product_category',
                                            queryset=ProductCategory.objects.all())
    currency = serializers.ChoiceField(choices=CURRENCY)

    class Meta:
        model = Product
        fields = '__all__'


class NewOrderSerialiser(serializers.Serializer):
    customer = serializers.SlugRelatedField(many=False, slug_field='id',
                                            queryset=User.objects.all())
    delivery = serializers.SlugRelatedField(many=False, slug_field='id',
                                            queryset=Delivery.objects.all())

    def create(self, validated_data):
        return SalesOrder.objects.create(**validated_data)


class NewOrderItemSerialiser(serializers.Serializer):
    sales_order_number = serializers.SlugRelatedField(many=False, slug_field='id',
                                                      queryset=SalesOrder.objects.all())
    product = serializers.SlugRelatedField(many=False, slug_field='id',
                                           queryset=Product.objects.all())
    quantity = serializers.IntegerField()

    def create(self, validated_data):
        return SalesOrderItem.objects.create(**validated_data)


class OrderSerialiser(serializers.Serializer):
    id = serializers.IntegerField()
    customer = serializers.SlugRelatedField(many=False, slug_field='username',
                                            queryset=User.objects.all())
    delivery = serializers.SlugRelatedField(many=False, slug_field='title',
                                            queryset=Delivery.objects.all())
    order_date = serializers.DateTimeField()

    class Meta:
        model = SalesOrder
        fields = '__all__'


class OrderItemSerialiser(serializers.Serializer):
    product = serializers.SlugRelatedField(many=False, slug_field='title',
                                           queryset=Product.objects.all())
    quantity = serializers.IntegerField()

    class Meta:
        model = SalesOrderItem
        fields = 'product, quantity'
