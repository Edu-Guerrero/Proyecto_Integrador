# views.py
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.template.loader import render_to_string
from django.http import HttpResponse
from .forms import UserRegistrationForm
from .models import CustomUser, Estudiante, KeyWords, PalabraEstudiante
from django.urls import reverse
from django.db import connection

def login_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        print(username, password)
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('table_user')  # Redirige a la página principal después del inicio de sesión
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
    keyword = KeyWords.objects.all()
    total_keywords = keyword.count()  # Get the total number of keywords
    # Call the stored procedure
    with connection.cursor() as cursor:
        cursor.callproc('ObtenerAsignaturasRestantes', [999999])  # Replace with your stored procedure name and parameters
        results = cursor.fetchall()
        cursor.close()
    
    with connection.cursor() as cursor:
        cursor.callproc('verSubEspRestantes', [777152])
        subEsP = cursor.fetchall()
        cursor.close()
    
    sub_esp = []
    filtered_results = []
    total_sum = 0

    results_2 = []
    for row in results:
        if row[0] is not None:
            results_2.append(row)

    for row in results_2:
        if total_sum + row[3] <= 16:
            filtered_results.append(row)
            total_sum += row[3]
        else:
            break  # Stop adding once the sum exceeds 16

    # Call another stored procedure for each value in row[1] of filtered_results
    asignaturas = []  # Initialize an empty list

    for row in results_2:
        with connection.cursor() as cursor:
            cursor.callproc('verCursos', [row[0]])  # Call the stored procedure
            result = cursor.fetchall()  # Fetch the results
            asignaturas.extend(result)  # Append the result to the existing list

    for row in subEsP:
        with connection.cursor() as cursor:
            cursor.callproc('verCursos', [row[3]])
            result = cursor.fetchall()
            asignaturas.extend(result)

    if request.method == 'POST' and 'update_filter' in request.POST:
        selected_courses = request.POST.getlist('all_results')
        print(selected_courses)
        
        # Filter asignaturas based on selected_courses
        asignaturas = []
        for row in results_2:
            if row[1] in selected_courses:
                with connection.cursor() as cursor:
                    cursor.callproc('verCursos', [row[0]])
                    result = cursor.fetchall()
                    asignaturas.extend(result)

        for row in subEsP:
            if row[1] in selected_courses:
                with connection.cursor() as cursor:
                    cursor.callproc('verCursos', [row[3]])
                    result = cursor.fetchall()
                    asignaturas.extend(result)

        context = {
            'filtered_results': selected_courses,
            'asignaturas': asignaturas,
        }

        if request.headers.get('x-requested-with') == 'XMLHttpRequest':
            html = render_to_string('table_content.html', context)
            print('AJAX request')
            return HttpResponse(html)
        else:
            print('Not an AJAX request')
            return render(request, 'table.html', context)

    return render(request, 'table.html', {
        'keyword': keyword, 
        'total_keywords': total_keywords,
        'results': results_2,
        'filtered_results': filtered_results,
        'asignaturas': asignaturas,
        'sub_esp': subEsP
        })

@login_required
def table_User(request):

    if request.method == 'POST' and 'logout' in request.POST:
        logout(request)
        return redirect(reverse('login'))  # Redirect to login page after logout
    
    correo_usuario = request.user.email

    # Buscar al estudiante correspondiente en la tabla Estudiante
    try:
        estudiante = Estudiante.objects.get(Correo=correo_usuario)
    except Estudiante.DoesNotExist:
        estudiante = None

    # Si se envía el formulario con las palabras clave seleccionadas
    if request.method == 'POST' and 'save_keywords' in request.POST:
        selected_keywords = request.POST.getlist('keyword')  # Obtener las keywords seleccionadas del formulario

        # Eliminar todas las palabras clave actuales del estudiante
        PalabraEstudiante.objects.filter(estudiante_id=estudiante).delete()

        # Guardar las nuevas palabras clave seleccionadas
        for id in selected_keywords:
            keyword_instance = KeyWords.objects.get(keyword_id=id)
            PalabraEstudiante.objects.create(estudiante=estudiante, keyword=keyword_instance)

    # Obtener el nombre de la carrera y del semestre si el estudiante existe
    carrera = estudiante.Carrera if estudiante else None
    semestre = estudiante.Semestre if estudiante else None

    keyword = KeyWords.objects.all()
    total_keywords = keyword.count()  # Get the total number of keywords

    # Obtener las palabras clave seleccionadas por el estudiante (si el estudiante existe)
    selected_keywords = []
    if estudiante:
        selected_keywords = PalabraEstudiante.objects.filter(estudiante=estudiante).values_list('keyword_id', flat=True)

    # Call the stored procedure
    with connection.cursor() as cursor:
        cursor.callproc('ObtenerAsignaturasRestantes', [estudiante.Estudiante_id])  # Replace with your stored procedure name and parameters
        results = cursor.fetchall()
    
    for row in results:
        print(row[4])

    # Renderizar el template con la lista de estudiantes
    return render(request, 'table_user.html', {
        'estudiante': estudiante,
        'carrera': carrera,
        'semestre': semestre,
        'keyword': keyword, 
        'total_keywords': total_keywords,
        'selected_keywords': selected_keywords,  # Pasar los IDs de las palabras clave seleccionadas
    })

def logout_view(request):
    logout(request)
    return redirect(reverse('login'))  # Redirect to login page after logout