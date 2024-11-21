import pandas as pd

path = "save_keywords\\translated_keywords.csv"

palabras_clave_df = pd.read_csv(path)

with open("keywrod_scripts.txt", "w") as file:
    idx = 1
    for palabra in (palabras_clave_df["Palabra_Clave"]):
        script = "UPDATE Keywords SET palabra = '"+ palabra+ "' Where Keyword_id = "+ str(idx)+";"
        idx += 1
        file.write(script + "\n")
