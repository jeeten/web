# from django.conf.urls import url
from django.urls import path, include
from .views import (My_appView,GetAccessTokenView)


urlpatterns = [
    path('get-access-token/', GetAccessTokenView.as_view(), name='get-access-token'),
    path('api/', My_appView.as_view(), name='my_app'),
]
