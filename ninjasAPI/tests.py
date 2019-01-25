import json
import random
from django.contrib.auth.models import User
from django.urls import reverse
from faker import Faker
from rest_framework.test import APITestCase
from ninjasAPI.models import ProductCategory, Product


class ApiTest(APITestCase):
    def setUp(self):
        fake = Faker('pl_PL')
        # generate 20 random users
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
                product.price = random.randint(1, 100) + (random.randint(1, 100) / 100)
                product.currency = random.randint(1, 4)
                product.category_id = cat.id
                product.picture = "prod_pic_1_" + str(x) + ".jpg"
                product.save()

    def test_login_user(self):
        # test login with valid credentials
        url = reverse("login")
        data = json.dumps(
            {"username": "user1",
             "password": "1234"}
        )
        response = self.client.post(url, data=data, content_type="application/json")
        self.assertEqual(response.status_code, 200)
        self.assertIn("token", response.data)
        self.assertIn('_auth_user_id', self.client.session)

        # test login with invalid credentials
        data = json.dumps(
            {"username": "user2",
             "password": "xxxxxxxxxx"}
        )
        response = self.client.post(url, data=data, content_type="application/json")
        self.assertEqual(response.status_code, 401)

    def test_products_view(self):
        url = reverse("products")
        # without login
        response = self.client.get(url, {})
        self.assertEqual(response.status_code, 401)
        # with login
        self.test_login_user()
        response = self.client.get(url, {})
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data["count"], 100)
        # check product data for 10 products
        product_data = ["id", "category", "currency", "title", "description", "price", "picture"]
        for x in range(0, 10):
            for pr_dat in product_data:
                self.assertIn(pr_dat, response.data["results"][x])
        # check pagination
        for x in range(2, 11):
            url = "/products/?page=" + str(x)
            response = self.client.get(url, {})
            self.assertEqual(response.status_code, 200)
            self.assertEqual(len(response.data["results"]), 10)

    def test_tokens(self):
        # get token
        url = reverse("token-auth")
        data = json.dumps(
            {"username": "user1",
             "password": "1234"}
        )
        response = self.client.post(url, data=data, content_type="application/json")
        self.assertEqual(response.status_code, 200)
        self.assertIn("token", response.data)
        token = response.data["token"]

        # verify token
        url = reverse("token-verify")
        data = json.dumps({"token": token})
        response = self.client.post(url, data=data, content_type="application/json")
        self.assertEqual(response.status_code, 200)
        self.assertIn("token", response.data)
        # wrong token (verify)
        wrongtoken = "xxxxxxxxxxxx"
        data = json.dumps({"token": wrongtoken})
        response = self.client.post(url, data=data, content_type="application/json")
        self.assertEqual(response.status_code, 400)

        # refresh token
        url = reverse("token-refresh")
        data = json.dumps({"token": token})
        response = self.client.post(url, data=data, content_type="application/json")
        self.assertEqual(response.status_code, 200)
        self.assertIn("token", response.data)
        # wrong token (refresh)
        data = json.dumps({"token": wrongtoken})
        response = self.client.post(url, data=data, content_type="application/json")
        self.assertEqual(response.status_code, 400)

        # authenticate with token
        auth = 'JWT ' + token
        url = reverse("products")
        response = self.client.get(url, HTTP_AUTHORIZATION=auth)
        self.assertEqual(response.status_code, 200)
        # authenticate with token (wrong token)
        token = "xxxxxxxxxxxx"
        auth = 'JWT ' + token
        response = self.client.get(url, HTTP_AUTHORIZATION=auth)
        self.assertEqual(response.status_code, 401)

# Im going to stop writing tests here, if needed I may finish that. I think this is enough for the sake of this coding challange
