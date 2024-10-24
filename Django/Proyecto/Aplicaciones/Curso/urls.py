# urls.py
from django.urls import path
from .views import login_view, logout_view, table, table_User, class_history

urlpatterns = [
    path('login/', login_view, name='login'),
    path('logout/', logout_view, name='logout'),
    path('table/', table, name='table'),
    path('table_user/', table_User, name='table_user'),
    path('history/', class_history, name="history")
]
