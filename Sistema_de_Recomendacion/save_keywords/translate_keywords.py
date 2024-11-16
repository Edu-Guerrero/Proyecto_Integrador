import os
import pandas as pd
from deep_translator import GoogleTranslator
from tqdm import tqdm

path = "keybert\\final_final_keywords.csv"

keywords_df = pd.read_csv(path)

palabras_clave = []
for keyword in (keywords_df["Keyword"]):
    palabra = GoogleTranslator(source = "en", target = "es").translate(keyword)
    palabras_clave.append(palabra)

    output_path = "save_keywords\\translated_keywords.csv"
    translated_df = pd.DataFrame(palabras_clave, columns=["Palabra_Clave"])
    translated_df.to_csv(output_path, index=False)