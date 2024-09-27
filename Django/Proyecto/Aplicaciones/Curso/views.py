# views.py
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from .forms import UserRegistrationForm
from .models import CustomUser, Estudiante

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        print(username, password)
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')  # Redirige a la página principal después del inicio de sesión
        else:
            return render(request, 'login.html', {'error': 'Credenciales incorrectas'})
    return render(request, 'login.html')

def logout_view(request):
    logout(request)
    return redirect('login')  # Redirige al inicio de sesión

def home(request):
    # Obtener el correo del usuario autenticado
    correo_usuario = request.user.email

    # Buscar al estudiante correspondiente en la tabla Estudiante
    try:
        estudiante = Estudiante.objects.get(Correo=correo_usuario)
        nombre_estudiante = f"{estudiante.Nombres} {estudiante.Apellidos}"
    except Estudiante.DoesNotExist:
        nombre_estudiante = "Estudiante no encontrado"

    # Renderizar el template con el nombre del estudiante
    return render(request, 'home.html', {'nombre_estudiante': nombre_estudiante})

def table(request):
    # Renderizar el template con la lista de estudiantes
    return render(request, 'table.html')