import spacy
import os
import pandas as pd
import re
from nltk.corpus import stopwords

# # Download necessary resources
# nltk.download('punkt')
# nltk.download('stopwords')
# nltk.download('wordnet')

# Load spaCy's larger Spanish model
nlp = spacy.load('es_core_news_lg')

# Preprocess text: lemmatization, lowercasing, punctuation removal, and stop word removal
def preprocess_text(text):
    text = text.lower()
    transltable = str.maketrans('áéíóúüñ', 'aeiouun')
    text = text.translate(transltable)
    text = re.sub(r'[^a-záéíóúüñ\s]', '', text)# Elimina toda la puntuación
    text = re.sub(r'\s+', ' ', text).strip()
    
    # Tokenizar el texto, eliminar las stopwords y la puntuación
    stop_words_es = stopwords.words('spanish')
    tokens = [token for token in text.split() if token not in stop_words_es]
    
    # Lemmatizar los tokens
    doc = nlp(' '.join(tokens))
    tokens = [token.lemma_.lower() for token in doc]

    for token in tokens:
        token = token.translate(transltable)
    
    return ' '.join(tokens)

# Load and preprocess text files from a folder, including filenames
def load_and_preprocess_texts(folder):
    data = []
    for filename in os.listdir(folder):
        if filename.endswith(".txt"):
            # Preprocess the filename (replace underscores with spaces)
            filename_without_extension = os.path.splitext(filename)[0].replace('_', ' ')
            
            # Read and preprocess the content of the file
            with open(os.path.join(folder, filename), 'r', encoding='utf-8') as file:
                content = file.read()
                preprocessed_text = preprocess_text(content)
            
            # Append the original filename and preprocessed text to the list
            data.append([filename_without_extension, preprocessed_text])
    return data

# Save preprocessed documents to a CSV file
def save_to_csv(data, output_file):
    df = pd.DataFrame(data, columns=['Original Filename', 'Preprocessed Text'])
    df.to_csv(output_file, index=False, encoding='utf-8')
    print(f"Preprocessed texts have been saved to '{output_file}'.")

# Example usage
folder_path = 'output_files\spanish'
output_csv_path = 'keywords\espanol\spanishpreprocessed_texts.csv'

preprocessed_data = load_and_preprocess_texts(folder_path)
save_to_csv(preprocessed_data, output_csv_path)
