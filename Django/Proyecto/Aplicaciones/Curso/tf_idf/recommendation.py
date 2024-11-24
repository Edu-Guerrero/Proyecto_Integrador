import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import numpy as np

class Recommendation:
    def __init__(self, courses, words, word_id, csv_file):
        self.courses = courses
        self.words = words
        self.words_id = word_id
        self.csv_file = csv_file
        self.df = self.read_csv()

    def read_csv(self):
        # Read the CSV file into a DataFrame
        return pd.read_csv(self.csv_file)
    
    def create_keywords(self):
        self.keywords = []
        for kw in self.words_id:
            if kw.keyword_id in self.words:
                self.keywords.append(kw.Palabra)
        self.keywords = ' '.join(self.keywords)
    
    def filter_documents(self):
        self.df = self.df[self.df['File_Name'].str.split(' ').str[0].astype(int).isin(self.courses)]

    def get_names(self):
        self.file_names = self.df['File_Name']
        self.tfidf_vectors = self.df.drop(columns=['File_Name']).values
        self.idFiles = [file_name.split(' ')[0] for file_name in self.file_names]

    def print_documents(self):
        print(self.idFiles)
        print(self.keywords)

    def create_vector(self):
        self.vectorizer = TfidfVectorizer()
        self.vectorizer.fit(self.df.drop(columns=['File_Name']).columns)                  
        self.query_vector = self.vectorizer.transform([self.keywords]).toarray()

    def get_recommendation(self):
        self.recommendation = cosine_similarity(self.query_vector, self.tfidf_vectors)[0]
        self.top_5_indices = np.argsort(self.recommendation)[::-1][:10]
        self.threshold = 0.135  # Set your threshold value here
        self.top_5_indices = [index for index in self.top_5_indices if self.recommendation[index] > self.threshold]
        self.top_5_files = self.file_names.iloc[self.top_5_indices]
        self.top_5_scores = self.recommendation[self.top_5_indices]
        # Display the results
        for i, (file, score) in enumerate(zip(self.top_5_files, self.top_5_scores), start=1):
            print(f"Rank {i}: {file} with similarity score {score:.4f}")
        return self.top_5_files
# Example usage:
# courses = ['course1', 'course2']
# words = ['word1', 'word2']
# csv_file = 'path_to_csv_file.csv'
# recommendation = Recommendation(courses, words, csv_file)
# filtered_docs = recommendation.filter_documents()
# print(filtered_docs)
