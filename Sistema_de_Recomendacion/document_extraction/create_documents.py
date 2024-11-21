import pymysql
import os
import re

# Configuración de conexión a la base de datos
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '123123',
    'database': 'proyectointegrador',
    'charset': 'utf8mb4'  # asegura compatibilidad con caracteres especiales
}

# Función para sanitizar el nombre del archivo
def sanitize_filename(filename):
    # Reemplazar caracteres no válidos con un guión bajo
    return re.sub(r'[<>:"/\\|?*]', '_', filename)

# Función para reemplazar espacios con guiones bajos
def replace_spaces_with_underscores(text):
    return text.replace(' ', '_')

# Conectar a la base de datos
try:
    connection = pymysql.connect(**db_config)
    cursor = connection.cursor()

    # Consulta para obtener los datos de la tabla
    query = "SELECT * FROM asignatura"
    cursor.execute(query)
    rows = cursor.fetchall()

    # Directorio para guardar los archivos
    output_dir = 'output_files\\spanish'
    os.makedirs(output_dir, exist_ok=True)

    # Iterar sobre cada fila del resultado
    for row in rows:
        # Crear el nombre del archivo usando row[0] y row[1]
        filename_raw = f"{row[0]}_{row[1]}.txt"  # Usar el formato row[0]_row[1]
        sanitized_filename = sanitize_filename(filename_raw)
        final_filename = replace_spaces_with_underscores(sanitized_filename)

        # Obtener el contenido de row[2]
        content = row[2]  # Contenido de row[2]

        # Definir la ruta del archivo
        file_path = os.path.join(output_dir, final_filename)

        # Escribir el contenido en el archivo
        with open(file_path, 'w', encoding='utf-8') as file:
            file.write(str(content))
        
        print(f"Archivo creado: {final_filename} con contenido de row[2]")

except pymysql.MySQLError as e:
    print(f"Error al conectar a la base de datos: {e}")
finally:
    # Cerrar la conexión
    if connection:
        connection.close()
        print("Conexión a la base de datos cerrada.")
