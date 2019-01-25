from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path, include
from ninjasAPI.views import Products, CreateNewOrder, OrderDetails, AllOrders, UsersWishList, UserWishList, LoginView
from ninjasProject import settings
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token, verify_jwt_token

urlpatterns = [
    # path('admin/', admin.site.urls),
    url(r'^admin/', admin.site.urls),
    url(r'^products/$', Products.as_view(), name="products"),
    url(r'^neworder/$', CreateNewOrder.as_view()),
    url(r'^order/(?P<id>[0-9]+)/$', OrderDetails.as_view()),
    url(r'^order/$', AllOrders.as_view()),
    url(r'^wishlist/$', UsersWishList.as_view()),
    url(r'^wishlist/(?P<id>[0-9]+)/$', UserWishList.as_view()),
    path('login/', LoginView.as_view(), name="login"),
    url(r'^api-token-auth/', obtain_jwt_token, name="token-auth"),
    url(r'^api-token-refresh/', refresh_jwt_token, name="token-refresh"),
    url(r'^api-token-verify/', verify_jwt_token, name="token-verify"),
    url(r'^jet/', include('jet.urls', 'jet')),  # Django JET URLS
    url(r'^jet/dashboard/', include('jet.dashboard.urls', 'jet-dashboard')),  # Django JET dashboard URLS

]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
