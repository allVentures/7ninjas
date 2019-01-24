from rest_framework import generics, status
from rest_framework.views import APIView
from rest_framework.response import Response

from ninjasAPI.models import Product, SalesOrder, SalesOrderItem, Currency_Rates
from ninjasAPI.serializers import ProductSerializer, NewOrderSerialiser, NewOrderItemSerialiser, OrderSerialiser, \
    OrderItemSerialiser


class Products(generics.ListCreateAPIView):
    queryset = Product.objects.all()
    serializer_class = ProductSerializer

    # paginantion http://127.0.0.1:8000/products/?offset=10  => global setting for 10 items

    # filtering by title => np: http://127.0.0.1:8000/products/?ProductTitle=a
    # filtering by category => /products/?category=8  (category number)

    def get_queryset(self):
        queryset = Product.objects.all()
        title = self.request.query_params.get('ProductTitle', None)
        category = self.request.query_params.get('category', None)
        if title is not None:
            queryset = queryset.filter(title__contains=title)
        if category is not None:
            queryset = queryset.filter(category_id=category)
        return queryset


# example order details = >http://127.0.0.1:8000/order/12/
class OrderDetails(APIView):
    # total & prices calculated in PLN
    @classmethod
    def order_info(cls, id):
        order_data = SalesOrder.objects.get(id=id)
        serializer = OrderSerialiser(order_data)
        response = serializer.data
        order_items = SalesOrderItem.objects.filter(sales_order_number=id)
        order = []
        x = 0
        total = 0
        for item in order_items:
            serializer = OrderItemSerialiser(item)
            order.append(serializer.data)
            price_in_pln = round(
                item.product.price * Currency_Rates.objects.get(currency=item.product.currency).currency_rate, 2)
            order[x]["price_in_pln"] = price_in_pln
            subtotal_in_pln = round(item.quantity * price_in_pln, 2)
            order[x]["subtotal_in_pln"] = subtotal_in_pln
            total = total + subtotal_in_pln
            x += 1
        response["order"] = order
        if order_data.delivery.fixed_price_delivery != None:
            delivery_cost = order_data.delivery.fixed_price_delivery
        else:
            delivery_cost = round(order_data.delivery.percentage_delivery_price * total, 2)
        response["number_of_products"] = x
        response["all_subtotal"] = round(total, 2)
        response["delivery_cost"] = delivery_cost
        response["total"] = total + delivery_cost
        return response

    def get(self, request, id):
        return Response(OrderDetails.order_info(id))

# sample order => http://127.0.0.1:8000/neworder/
# {
# 	"customer": 11,
# 	"delivery": 1,
# 	"order": [{
# 			"product": 1,
# 			"quantity": 11
# 		},
# 		{
# 			"product": 4,
# 			"quantity": 15
# 		}
# 	]
# }

class CreateNewOrder(APIView):
    def post(self, request):
        data = request.data
        order_items = request.data.get('order')
        del (data["order"])
        serializer = NewOrderSerialiser(data=data)
        if serializer.is_valid(raise_exception=True) and order_items:
            serializer.save()
            order_id = SalesOrder.objects.all().last().id
            for item in order_items:
                item["sales_order_number"] = order_id
                serializer = NewOrderItemSerialiser(data=item)
                if serializer.is_valid(raise_exception=True):
                    serializer.save()
                else:
                    return Response(status=status.HTTP_400_BAD_REQUEST)
            return Response(OrderDetails.order_info(order_id), status=status.HTTP_201_CREATED)
        else:
            return Response(status=status.HTTP_400_BAD_REQUEST)
