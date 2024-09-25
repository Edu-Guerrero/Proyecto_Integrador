from bs4 import BeautifulSoup

def generate_course_info(html_content):
    soup = BeautifulSoup(html_content, 'html.parser')

    # Find all rows in the table
    rows = soup.find_all('tr')

    for row in rows:
        cols = row.find_all('td')
        if len(cols) >= 3:
            # Extract code and number
            code_full = cols[0].get_text(strip=True)
            # Split by space and take the first two elements only (code and number)
            parts = code_full.split()
            if len(parts) >= 2:
                code = parts[0]  # e.g., 'MAT'
                number = parts[1]  # e.g., '1301'

                # Extract name and credits
                name = cols[1].get_text(strip=True).split('+Ej')[0].strip()  # Remove "+Ej" suffix
                credits = cols[2].get_text(strip=True).strip()

                # Print course information in the desired format
                print(f"({name}, '', 34, 4, 3, {number}, {credits}, NULL),")

# Load your HTML file
with open('MinorClass.html', 'r', encoding='utf-8') as file:
    html_content = file.read()

# Generate and print course info
generate_course_info(html_content)
