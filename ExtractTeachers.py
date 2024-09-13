from bs4 import BeautifulSoup

def replace_tildes(text):
    vowels = 'aeioun'
    vowel_map = str.maketrans('áéíóúñÁÉÍÓÚ', 'aeiounAEIOU')
    return text.translate(vowel_map)


def generate_sql_insert_statements(html_content):
    soup = BeautifulSoup(html_content, 'html.parser')

    # Find all relevant articles
    articles = soup.find_all('article', class_='node--type-profile')

    # Prepare the base SQL statement
    sql_statements = []
    values = []

    for article in articles:
        # Extract teacher's name
        name_div = article.find('div', class_='field--name-field-display-title')
        if name_div:
            name = name_div.find('h3').get_text(strip=True).replace("'", "''")  # Escape single quotes
            name_no_tildes = replace_tildes(name)
            
            # Extract email
            email_div = article.find('div', class_='field--name-field-email')
            if email_div:
                email = email_div.find('a').get_text(strip=True).replace("'", "''")  # Escape single quotes
                email_no_tildes = replace_tildes(email)
                
                # Add to values list
                values.append(f"('{name_no_tildes}', '{email_no_tildes}')")

        # Join values into a single SQL statement
    if values:
        sql = f"INSERT INTO teachers (name, email) VALUES\n" + ",\n".join(values) + ";"
        sql_statements.append(sql)

    # Print the SQL statement
    if sql_statements:
        print(sql_statements[0])
    # Print all SQL statements
    for statement in sql_statements:
        print(statement)

# Load your HTML file
with open('profesores.html', 'r', encoding='utf-8') as file:
    html_content = file.read()

# Generate and print SQL insert statements
generate_sql_insert_statements(html_content)
