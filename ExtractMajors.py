from bs4 import BeautifulSoup

def replace_vowels_with_tildes(text):
    vowels = 'aeioun'
    vowel_map = str.maketrans('áéíóúñ', 'aeioun')
    return text.translate(vowel_map)

# Load your HTML file
with open('carreras.html', 'r', encoding='utf-8') as file:
    html_content = file.read()

# Parse the HTML content with BeautifulSoup
soup = BeautifulSoup(html_content, 'html.parser')

# Find all the relevant articles
articles = soup.find_all('article', class_='node--type-undergraduate-career')

# Extract the major and school information
for article in articles:
    major = article.find('h3', class_='undergrad_title')
    if major:
        major_name = major.get_text(strip=True)
        major_name_with_tildes = replace_vowels_with_tildes(major_name)
        
        # Extract school name
        school = article.find('div', class_='field--name-field-faculty')
        if school:
            school_name = school.get_text(strip=True).replace('\n', '').strip()
            school_name_with_tildes = replace_vowels_with_tildes(school_name)
            
            print(f'Carrera: {major_name_with_tildes}, Colegio: {school_name_with_tildes}')
