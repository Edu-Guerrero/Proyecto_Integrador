import spacy
import os
import pandas as pd

# Load spaCy's larger English model
nlp = spacy.load('en_core_web_lg')

# Preprocess text: lemmatization, lowercasing, punctuation removal, and stop word removal
def preprocess_text(text):
    doc = nlp(text)
    # Keep only lemmatized words that are not stop words or punctuation
    tokens = [token.lemma_.lower() for token in doc if not token.is_stop and not token.is_punct]
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
folder_path = 'output_files\english'
output_csv_path = 'keywords\englishpreprocessed_texts.csv'

preprocessed_data = load_and_preprocess_texts(folder_path)
save_to_csv(preprocessed_data, output_csv_path)
