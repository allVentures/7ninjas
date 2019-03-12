Task Description:

Write REST API for simple selling platform.

Use Python 3.6+, Django 1.11+, DRF 3.6+; Front-end is not needed;

Entities:

 - Product: title, image, description, price (both value and currency), category, likes (user likes product and it gets added to user's wish list);

 - Type of deliveries: title, price (could be fixed value or percent of product's price) 

 - Category: title;

 - Order: product (which is ordered), user (who orders), chosen delivery, total price (product's price + delivery's price), count of products;

 It must contain next endpoints:

 - List of products with pagination, simple filtering by category and simple search by product's title;

 - User's wish list;

 - Create new order;

 - OAuth/JWT;

and admin panel where staff user can add/edit/remove products, categories, users and see list of orders.
