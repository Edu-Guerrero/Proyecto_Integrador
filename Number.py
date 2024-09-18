import random

def generate_number():
    number = "00" + ''.join(str(random.randint(1, 9)) for _ in range(6))
    return number

def generate_valid_number():
    while True:
        number = random.randint(100, 310)
        tens_digit = (number // 10) % 10
        if tens_digit <= 1:
            return number

def create_cursos(asig_id):
    for i in range(1, 6):
        curso_id = i + ((asig_id-1)*5)
        prof_id = random.randint(1, 212)
        horario_id = random.randint(1, 10)
        campus_id = random.randint(1, 3)
        modalidad_id = random.randint(1, 4)
        edificio_id = random.randint(1, 22)
        cupo = random.choice([15, 20, 25, 30, 35, 40, 45, 50])
        aula = generate_valid_number()
        print(f"({curso_id}, {asig_id}, {prof_id}, {horario_id}, {campus_id}, {modalidad_id}, {edificio_id}, {cupo}, {aula}),")

def generate_numbers():
    # Define the possible outcomes and their respective probabilities
    outcomes = [(1, 3), (2, 4), (5,)]
    probabilities = [0.475, 0.475, 0.05]  # Adjust probabilities as needed

    # Use random.choices to select an outcome based on the defined probabilities
    chosen_outcome = random.choices(outcomes, probabilities)[0]

    return chosen_outcome

def create_dias_asignatura(num_cursos):
    id_curso_dia = 1
    for i in range (1, num_cursos+1):
        dias = generate_numbers()
        for dia in dias:
            print(f"({id_curso_dia}, {i}, {dia}),")
            id_curso_dia += 1
    

if __name__ == "__main__":
    #for i in range (100):
        #print(f"UPDATE Estudiante SET Estudiante_id = {generate_number()} WHERE Estudiante_id = {i+1};")
    #for i in range(1, 143):
        #create_cursos(i)
    create_dias_asignatura(710)