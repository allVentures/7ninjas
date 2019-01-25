from django.contrib import admin
from ninjasAPI.models import ProductCategory


# ------------- Standard Models----------------
class ProductCategoryAdmin(admin.ModelAdmin):
    list_filter = ['id', 'product_category']
    list_display = ['product_category', 'id']
    ordering = ['id']
    search_fields = ['product_category']


admin.site.register(ProductCategory, ProductCategoryAdmin)
