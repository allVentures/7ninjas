import json
from django.contrib.auth.models import User
from django.urls import reverse
from rest_framework.test import APITestCase


class ApiTest(APITestCase):
    def setUp(self):
        User.objects.create_user(
            username="user1",
            email="test@mail.com",
            password="1234",
        )

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

