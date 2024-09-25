from bs4 import BeautifulSoup

college_map = {
    1: "Colegio de Administracion de Empresas",
    2: "Colegio de Arquitectura y Diseño Interior",
    3: "Colegio de Ciencias Biologicas y Ambientales",
    4: "Colegio de Ciencias de la Salud",
    5: "Colegio de Ciencias e Ingenierias",
    6: "Colegio de Ciencias Sociales y Humanidades",
    7: "Colegio de Comunicacion y Artes Contemporaneas",
    8: "Colegio de Economia",
    9: "Colegio de Hospitalidad, Arte Culinario y Turismo",
    10: "Colegio de Jurisprudencia",
    11: "College of Music"
}

# Inverted map (Name to ID)
name_to_id_map = {name: id for id, name in college_map.items()}

# Function to get ID by name
def get_id_by_name(college_name):
    return name_to_id_map.get(college_name, "COLLEGE NOT FOUND")

def replace_vowels_with_tildes(text):
    vowels = 'aeioun'
    vowel_map = str.maketrans('áéíóúñÁÉÍÓÚ', 'aeiounAEIOU')
    return text.translate(vowel_map)

# Load your HTML file
with open('subEsp.html', 'r', encoding='utf-8') as file:
    html_content = file.read()

soup = BeautifulSoup(html_content, 'html.parser')

# Find all school names
schools = soup.find_all('h3')
print("INSERT INTO Subespecializaciones (SubEsp_id, Colegio_id, Nombre) VALUES")
i = 0
for school in schools:
	school_name = school.text.strip()
	school_name_with_tildes = replace_vowels_with_tildes(school_name)
	# Find the next sibling div which contains the minors
	minors_div = school.find_next_sibling('div', class_='grid views-view-grid')
	if minors_div:
		# Find all minor names within this div
		minors = minors_div.find_all('h4')
		for minor in minors:
			minor_name = minor.text.strip()
			minor_name_with_tildes = replace_vowels_with_tildes(minor_name)
			colegio = get_id_by_name(school_name_with_tildes)
			print(f"({i}, {minor_name_with_tildes}, {colegio}),")
			i += 1

