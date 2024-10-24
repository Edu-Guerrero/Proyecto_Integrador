# views.py
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.template.loader import render_to_string
from django.http import HttpResponse
from .models import Estudiante, KeyWords, PalabraEstudiante, SubEspecializacion
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
    
    Minors = SubEspecializacion.objects.all()

    context = {
        'keyword': keyword, 
        'total_keywords': total_keywords,
        'results': results_2,
        'filtered_results': filtered_results,
        'asignaturas': asignaturas,
        'sub_esp': subEsP,
        'SubEspecializacion': Minors
    }

    return render(request, 'table.html', context)

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

    if request.method == 'POST' and 'saveSub' in request.POST:
        subesp_id = request.POST.get('subesp')
        print(subesp_id)
        if subesp_id:
            subesp = SubEspecializacion.objects.get(subesp_id=subesp_id)
            estudiante.Subespecializacion = subesp
        else:
            estudiante.Subespecializacion = None
        estudiante.save()

    # Obtener el nombre de la carrera y del semestre si el estudiante existe
    carrera = estudiante.Carrera if estudiante else None
    semestre = estudiante.Semestre if estudiante else None
    subespec = getattr(estudiante, 'Subespecializacion', None)

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

    with connection.cursor() as cursor:
        cursor.callproc('verSubEspRestantes', [estudiante.Estudiante_id])
        subEsP = cursor.fetchall()
        cursor.close()

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

    
    prereq = []
    coreq = []
    restr = []
    cumplePre = []
    cumpleRest = []

    for row in results_2:
        with connection.cursor() as cursor:
            cursor.callproc('ObtenerDetallesAsignatura', [row[0]])
            prereq.extend(cursor.fetchall())

    for row in results_2:
        with connection.cursor() as cursor:
            cursor.callproc('ObtenerCorrequisitos', [row[0]])
            coreq.extend(cursor.fetchall())

    for row in results_2:
        with connection.cursor() as cursor:
            cursor.callproc('ObtenerInformacionAsignatura', [row[0]])
            restr.extend(cursor.fetchall())

    for row in results_2:
        with connection.cursor() as cursor:
            cursor.callproc('VerificarPrerrequisitos', [estudiante.Estudiante_id, row[0]])
            cumplePre.extend(cursor.fetchall())

    for row in results_2:
        with connection.cursor() as cursor:
            cursor.callproc('VerificarRestriccionesEstudiante', [estudiante.Estudiante_id, row[0]])
            cumpleRest.extend(cursor.fetchall())
    
    for row in subEsP:
        with connection.cursor() as cursor:
            cursor.callproc('ObtenerDetallesAsignatura', [row[3]])
            prereq.extend(cursor.fetchall())

    for row in subEsP:
        with connection.cursor() as cursor:
            cursor.callproc('ObtenerCorrequisitos', [row[3]])
            coreq.extend(cursor.fetchall())

    for row in subEsP:
        with connection.cursor() as cursor:
            cursor.callproc('ObtenerInformacionAsignatura', [row[3]])
            restr.extend(cursor.fetchall())

    for row in subEsP:
        with connection.cursor() as cursor:
            cursor.callproc('VerificarPrerrequisitos', [estudiante.Estudiante_id, row[3]])
            cumplePre.extend(cursor.fetchall())

    for row in subEsP:
        with connection.cursor() as cursor:
            cursor.callproc('VerificarRestriccionesEstudiante', [estudiante.Estudiante_id, row[3]])
            cumpleRest.extend(cursor.fetchall())

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
                    cursor.close()

        for row in subEsP:
            if row[1] in selected_courses:
                with connection.cursor() as cursor:
                    cursor.callproc('verCursos', [row[3]])
                    result = cursor.fetchall()
                    asignaturas.extend(result)
                    cursor.close()
        context = {
            'filtered_results': selected_courses,
            'asignaturas': asignaturas,
            'prereq': prereq,
            'coreq': coreq,
            'restr': restr,
            'cumplePre': cumplePre,
            'cumpleRest': cumpleRest
        }

        if request.headers.get('x-requested-with') == 'XMLHttpRequest':
            html = render_to_string('table_content.html', context)
            print('AJAX request')
            return HttpResponse(html)
        else:
            print('Not an AJAX request')
            return render(request, 'table.html', context)
    
    Minors = SubEspecializacion.objects.all()

    context = {
        'estudiante': estudiante,
        'carrera': carrera,
        'semestre': semestre,
        'subespec': subespec,
        'keyword': keyword, 
        'total_keywords': total_keywords,
        'results': results_2,
        'filtered_results': filtered_results,
        'asignaturas': asignaturas,
        'sub_esp': subEsP,
        'SubEspecializacion': Minors,
        'selected_keywords': selected_keywords,  # Pasar los IDs de las palabras clave seleccionadas
        'prereq': prereq,
        'coreq': coreq,
        'restr': restr,
        'cumplePre': cumplePre,
        'cumpleRest': cumpleRest
    }

    # Renderizar el template con la lista de estudiantes
    return render(request, 'table_user.html', context)

def logout_view(request):
    logout(request)
    return redirect(reverse('login'))  # Redirect to login page after logout

@login_required
def class_history(request):
    correo_usuario = request.user.email
    # Buscar al estudiante correspondiente en la tabla Estudiante
    try:
        estudiante = Estudiante.objects.get(Correo=correo_usuario)
    except Estudiante.DoesNotExist:
        estudiante = None
    
    history = []
    with connection.cursor() as cursor:
        cursor.callproc('ObtenerKardexEst', [estudiante.Estudiante_id])
        history.extend(cursor.fetchall())
    
    for row in history:
        print(row)
    
    context = {
        'history':history
    }

    return render(request, 'history.html', context)