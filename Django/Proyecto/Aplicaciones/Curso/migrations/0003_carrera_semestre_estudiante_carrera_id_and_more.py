# Generated by Django 5.1.1 on 2024-10-08 16:18

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Curso', '0002_estudiante'),
    ]

    operations = [
        migrations.CreateModel(
            name='Carrera',
            fields=[
                ('Carrera_id', models.AutoField(primary_key=True, serialize=False)),
                ('Colegio_id', models.IntegerField()),
                ('Abreviatura', models.CharField(max_length=10)),
                ('Nombre', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'Carrera',
            },
        ),
        migrations.CreateModel(
            name='Semestre',
            fields=[
                ('Semestre_id', models.IntegerField(primary_key=True, serialize=False)),
                ('Nombre', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'Semestre',
            },
        ),
        migrations.AddField(
            model_name='estudiante',
            name='Carrera_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='Curso.carrera'),
        ),
        migrations.AddField(
            model_name='estudiante',
            name='Semestre_id',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='Curso.semestre'),
        ),
    ]