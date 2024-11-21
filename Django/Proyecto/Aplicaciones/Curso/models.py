# Curso/models.py

from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.db import models

class CustomUserManager(BaseUserManager):
    def create_user(self, username, email, password=None, **extra_fields):
        """
        Crea y guarda un usuario con el nombre de usuario y la contraseña.
        """
        if not email:
            raise ValueError('El email debe ser proporcionado')
        if not username:
            raise ValueError('El nombre de usuario debe ser proporcionado')
        
        email = self.normalize_email(email)
        user = self.model(username=username, email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, email, password=None, **extra_fields):
        """
        Crea y guarda un superusuario con nombre de usuario y contraseña.
        """
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_staff', True)
        return self.create_user(username, email, password, **extra_fields)

class CustomUser(AbstractBaseUser):
    username = models.CharField(max_length=150, unique=True)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.EmailField(max_length=254, unique=True)
    is_staff = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    is_superuser = models.BooleanField(default=False)
    last_login = models.DateTimeField(null=True, blank=True)
    date_joined = models.DateTimeField(auto_now_add=True)

    USERNAME_FIELD = 'username'
    EMAIL_FIELD = 'email'
    REQUIRED_FIELDS = ['email']

    objects = CustomUserManager()

    class Meta:
        db_table = 'auth_user'
        verbose_name = 'user'
        verbose_name_plural = 'users'

    def __str__(self):
        return self.username

class Carrera(models.Model):
    Carrera_id = models.AutoField(primary_key=True)  # Identificador único de la carrera
    Colegio_id = models.IntegerField()  # FK hacia el Colegio (se define como IntegerField si Colegio está en otra app/tablas no gestionadas por Django)
    Abreviatura = models.CharField(max_length=10)  # Abreviatura de la carrera
    Nombre = models.CharField(max_length=255)  # Nombre completo de la carrera

    class Meta:
        db_table = 'Carrera'  # Nombre de la tabla en la base de datos

    def __str__(self):
        return self.Nombre
    
class Semestre(models.Model):
    Semestre_id = models.IntegerField(primary_key=True)  # Identificador único del semestre
    Nombre = models.CharField(max_length=255)  # Nombre del semestre

    class Meta:
        db_table = 'Semestre'  # Nombre de la tabla en la base de datos

    def __str__(self):
        return self.Nombre


class SubEspecializacion(models.Model):
    subesp_id = models.AutoField(primary_key=True)  # Identificador único
    Colegio_id = models.IntegerField()  # FK del colegio, con eliminación en cascada
    nombre = models.CharField(max_length=255)  # Nombre del minor

    def __str__(self):
        return self.nombre
    
    class Meta:
        db_table = 'SubEspecializacion'

class Estudiante(models.Model):
    Estudiante_id = models.IntegerField(primary_key=True)  # Identificador único del estudiante
    Nombres = models.CharField(max_length=255)  # Nombres del estudiante
    Apellidos = models.CharField(max_length=255)  # Apellidos del estudiante
    Correo = models.EmailField(max_length=255, unique=True)  # Correo institucional
    Password = models.CharField(max_length=255)  # Contraseña del estudiante (se manejará cifrada)
    Carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE, default=1, db_column='Carrera_id')  # FK hacia la carrera
    Semestre = models.ForeignKey(Semestre, on_delete=models.CASCADE, default=1, db_column='Semestre_id')  # FK hacia el semestre
    Subespecializacion = models.ForeignKey(SubEspecializacion, on_delete=models.CASCADE, default=1, db_column='SubEsp_id')  # FK hacia la subespecialización

    def __str__(self):
        return f'{self.Nombres} {self.Apellidos}'

    class Meta:
        db_table = 'Estudiante'

class KeyWords(models.Model):
    keyword_id = models.AutoField(primary_key=True)  # Automatically increments for each keyword
    Palabra = models.CharField(max_length=255)       # Keyword field with a maximum length of 255 characters

    def __str__(self):
        return self.Palabra  # Return the keyword as the string representation of the object
    
    class Meta:
        db_table = 'KeyWords'


class PalabraEstudiante(models.Model):
    palabra_estudiante_id = models.AutoField(primary_key=True)
    keyword = models.ForeignKey(KeyWords, on_delete=models.CASCADE)  # Relación con la tabla KeyWords
    estudiante = models.ForeignKey(Estudiante, on_delete=models.CASCADE)  # Relación con la tabla Estudiante

    def __str__(self):
        return f"{self.estudiante} - {self.keyword}"
    
    class Meta:
        db_table = 'Palabra_Estudiante'
