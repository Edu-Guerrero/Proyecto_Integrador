# urls.py
from django.urls import path
from .views import login_view, logout_view, home, table, table_User

urlpatterns = [
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('home/', home, name='home'),
    path('table/', table, name='table'),
    path('table_user/', table_User, name='table_user'),
    path('logout/', logout_view, name='logout'),
]
