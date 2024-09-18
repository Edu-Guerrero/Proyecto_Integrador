from bs4 import BeautifulSoup

def replace_tildes(text):
    vowels = 'aeioun'
    vowel_map = str.maketrans('áéíóúñÁÉÍÓÚ', 'aeiounAEIOU')
    return text.translate(vowel_map)

def generate_subject_info(html_content):
    soup = BeautifulSoup(html_content, 'html.parser')

    # Define the hash map for subject IDs
    subject_id_map = {
        'ADM': 1, 'ADG': 2, 'ANI': 3, 'ANT': 4, 'ARQ': 5, 'ARL': 6, 'ART': 7,
        'MOD': 8, 'BIO': 9, 'BTC': 10, 'POL': 11, 'CIN': 12, 'CMC': 13, 'COM': 14,
        'DER': 15, 'DIN': 16, 'DMI': 17, 'DIC': 18, 'ECN': 19, 'EDU': 20, 'EMC': 21,
        'FIN': 22, 'FIS': 23, 'GST': 24, 'GAG': 25, 'HSP': 26, 'AMB': 27, 'CIV': 28,
        'AGR': 29, 'ALI': 30, 'CMP': 31, 'ELE': 32, 'MAC': 33, 'IIN': 34, 'MEC': 35,
        'QUI': 36, 'MAK': 37, 'MAT': 38, 'MED': 39, 'VET': 40, 'NUT': 41, 'ODO': 42,
        'PER': 43, 'PRM': 44, 'PSI': 45, 'PSC': 46, 'PUB': 47, 'RIN': 48, 'ESP': 49,
        'ESL': 50, 'PRC': 51, 'PAS': 52, 'ING': 53, 'SEG': 54, 'FOT': 55, 'CCO': 56
    }

    # Find all relevant rows
    rows = soup.find_all('tr')

    for row in rows:
        # Extract subject code and number
        code_td = row.find('td', class_='descripcionmateria')
        if code_td:
            code_text = code_td.get_text(strip=True)
            parts = code_text.split()
            subject_code = parts[0]  # Extract code from text
            subject_number = parts[1] if len(parts) > 1 else None

            # Extract subject name and credits
            name_td = row.find_all('td')[1]  # Assuming name is in the second <td>
            if name_td:
                name_text = name_td.get_text(strip=True).split('<br')[0].strip()
                subject_name = replace_tildes(name_text)
                
                # Extract credits from the last <td>
                credits_td = row.find_all('td')[-1]
                credits = credits_td.get_text(strip=True) if credits_td else None

                # Retrieve ID from hash map
                subject_id = subject_id_map.get(subject_code, 'Unknown')
                
                # Print formatted information
                print(f"('{subject_name}', '', {subject_id}, NULL, 3, {credits}, {subject_number}, NULL),")

# Load your HTML file
with open('asignaturas.html', 'r', encoding='utf-8') as file:
    html_content = file.read()

# Generate and print subject information
generate_subject_info(html_content)
 