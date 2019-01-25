import random
from django.contrib.auth.models import User
from faker import Faker
from ninjasAPI.models import ProductCategory, Product, Delivery, SalesOrder, SalesOrderItem, WishList

fake = Faker('pl_PL')

Generate 20 fake users
username_base = "user"

for x in range(1, 21):
    email = fake.email()
    first_name = fake.first_name()
    last_name = fake.last_name()
    User.objects.create_user(
        username=username_base + str(x),
        password="1234",
        first_name=first_name,
        last_name=last_name,
        email=email,
    )

# genrate 10 random categories
for x in range(1, 11):
    cat_obj = ProductCategory()
    words = fake.words(nb=1, ext_word_list=None, unique=True)
    category = "Kategoria " + words[0]
    cat_obj.product_category = category
    cat_obj.save()


# Generate random products (10 in each category)

all_categories = ProductCategory.objects.all()
for cat in all_categories:
    for x in range(1, 11):
        product = Product()
        words = fake.words(nb=2, ext_word_list=None, unique=True)
        product.title = words[0] + " " + words[1]
        product.description = fake.sentence(nb_words=30, variable_nb_words=True, ext_word_list=None)
        product.price = random.randint(1, 100) + (random.randint(1, 100)/100)
        product.currency = random.randint(1, 4)
        product.category_id = cat.id
        product.picture = "prod_pic_1_" + str(x) + ".jpg"
        product.save()

# Generate random delivery options, 5 fixed and 5 %-based

for x in range(1, 6):
    delivery = Delivery()
    delivery.title = fake.sentence(nb_words=5, variable_nb_words=True, ext_word_list=None)
    delivery.fixed_price_delivery = random.randint(1, 20) + (random.randint(1, 100)/100)
    delivery.save()

for x in range(1, 6):
    delivery = Delivery()
    delivery.title = fake.sentence(nb_words=5, variable_nb_words=True, ext_word_list=None)
    delivery.percentage_delivery_price = random.randint(1, 5)/100
    delivery.save()


# random sales orders (100)
for x in range(1,101):
    order = SalesOrder()
    random_user = random.randint(1, 20)
    random_delivery_method = random.randint(1, 10)
    order.customer_id = random_user
    order.delivery_id = random_delivery_method
    order.save()

# populate 5 order items for each order
orders = SalesOrder.objects.all()
for ord in orders:
    for x in range(1,6):
        order_item = SalesOrderItem()
        random_product = random.randint(1, 100)
        random_quantity = random.randint(1, 30)
        order_item.quantity = random_quantity
        order_item.product_id = random_product
        order_item.sales_order_number_id = ord.id
        order_item.save()

# populate 5 likes / whished per customer

users = User.objects.all()
for usr in users:
    for x in range(1,6):
        random_product_id = random.randint(1, 100)
        WishList.objects.create(customer_id=usr.id, product_id=random_product_id)

# Superuser to manage admin
User.objects.create_superuser(username="admin", password="1234", email="test@email.com")

# python3 manage.py shell < working_scripts.py
