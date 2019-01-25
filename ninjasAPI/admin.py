from django.contrib import admin
from django.utils.html import format_html
from jet.admin import CompactInline
from ninjasAPI.models import ProductCategory, Product, SalesOrder, SalesOrderItem, CURRENCY, Currency_Rates

# ------------- InLine Models----------------
from ninjasAPI.views import OrderDetails


class ProductsInline(CompactInline):
    model = Product
    extra = 0
    readonly_fields = ["avatar"]

    def avatar(self, obj):
        return format_html('<img src="{}" style="width:280px"/>'.format(obj.picture.url))

    show_change_link = True


class SalesOrderItemInline(CompactInline):
    model = SalesOrderItem
    extra = 0
    show_change_link = True

    readonly_fields = ["product_price", "currency", "exchange_rate", "subtotal_in_pln"]

    def product_price(self, obj):
        product_price = Product.objects.get(id=obj.product_id).price
        return product_price

    def currency(self, obj):
        currency_id = Product.objects.get(id=obj.product_id).currency
        currency = CURRENCY[int(currency_id) - 1][1]
        return currency

    def exchange_rate(self, obj):
        exchange_rate = Currency_Rates.objects.get(currency=obj.product.currency).currency_rate
        return exchange_rate

    def subtotal_in_pln(self, obj):
        price_in_pln = obj.product.price * Currency_Rates.objects.get(currency=obj.product.currency).currency_rate
        subtotal_in_pln = round(obj.quantity * price_in_pln, 2)
        return subtotal_in_pln

    subtotal_in_pln.short_description = "Subtotal in PLN"


# ------------- Standard Models----------------
class ProductCategoryAdmin(admin.ModelAdmin):
    list_filter = ['id', 'product_category']
    list_display = ['product_category', 'product_count', 'id']
    ordering = ['id']
    search_fields = ['product_category']

    inlines = [ProductsInline, ]


admin.site.register(ProductCategory, ProductCategoryAdmin)


class ProductAdmin(admin.ModelAdmin):
    list_filter = ['id', 'title']
    list_display = ['title', 'id', 'category', 'price', 'currency']
    ordering = ['id']
    search_fields = ['title']
    readonly_fields = ["avatar"]
    list_per_page = 50

    def avatar(self, obj):
        return format_html('<img src="{}" style="width:280px"/>'.format(obj.picture.url))


admin.site.register(Product, ProductAdmin)


class SalesOrderAdmin(admin.ModelAdmin):
    list_filter = ['id', 'customer']
    list_display = ['id', 'customer', 'delivery', 'order_date']
    ordering = ['id']
    search_fields = ['customer', 'delivery']
    readonly_fields = ["id", "number_of_items", "all_subtotal_in_pln", "delivery_cost_in_pln", "total_in_pln"]
    list_per_page = 50

    def number_of_items(self, obj):
        id = obj.id
        return OrderDetails.order_info(id)["number_of_products"]

    def all_subtotal_in_pln(self, obj):
        id = obj.id
        return round(float(OrderDetails.order_info(id)["all_subtotal"]), 2)

    def delivery_cost_in_pln(self, obj):
        id = obj.id
        return round(float(OrderDetails.order_info(id)["delivery_cost"]), 2)

    def total_in_pln(self, obj):
        id = obj.id
        return round(float(OrderDetails.order_info(id)["total"]), 2)

    inlines = [SalesOrderItemInline, ]

    all_subtotal_in_pln.short_description = "All subtotal in PLN"
    delivery_cost_in_pln.short_description = "Delivery cost in PLN"
    total_in_pln.short_description = "Total in PLN"


admin.site.register(SalesOrder, SalesOrderAdmin)
