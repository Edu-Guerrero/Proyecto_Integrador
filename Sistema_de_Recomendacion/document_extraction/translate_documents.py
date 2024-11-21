import os
from deep_translator import GoogleTranslator
from tqdm import tqdm

def translate_files(input_folder, output_folder):
    # Verificar si la carpeta de salida existe, si no, crearla
    if not os.path.exists(output_folder):
        os.makedirs(output_folder)

    files = [f for f in os.listdir(input_folder) if f.endswith(".txt")]

    # Iterar sobre los archivos con una barra de progreso
    for filename in tqdm(files, desc="Translating files"):
        input_path = os.path.join(input_folder, filename)
        
        # Traducir el nombre del archivo (sin la extensión)
        filename_without_extension = os.path.splitext(filename)[0]
        translated_filename = GoogleTranslator(source='es', target='en').translate(filename_without_extension)
        translated_filename = translated_filename.replace(" ", "_") + ".txt"
        
        output_path = os.path.join(output_folder, translated_filename)
        
        # Leer el contenido del archivo de entrada
        with open(input_path, 'r', encoding='utf-8') as file:
            text = file.read()
            translated_text = GoogleTranslator(source='es', target='en').translate(text)
        
        # Escribir el contenido traducido en el archivo de salida
        with open(output_path, 'w', encoding='utf-8') as file:
            file.write(translated_text)

input_folder = 'output_files/spanish'
output_folder = 'output_files/english'
translate_files(input_folder, output_folder)
