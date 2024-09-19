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
    
def give_students_words(num_students):

    students = [278516,
                544377,
                586231,
                913246,
                924753,
                213666,
                519666,
                713193,
                534162,
                682259,
                686248,
                873282,
                963454,
                977921,
                175841,
                316987,
                541819,
                712317,
                834838,
                237479,
                332982,
                467432,
                835627,
                252272,
                375744,
                411821,
                745233,
                143759,
                311782,
                935733,
                133745,
                365624,
                457697,
                565796,
                413142,
                677265,
                693192,
                837448,
                991289,
                293869,
                444451,
                499535,
                569714,
                528672,
                627212,
                955876,
                278172,
                329156,
                335334,
                822363,
                866379,
                699775,
                819321,
                957113,
                543813,
                658294,
                751837,
                996597,
                234481,
                398116,
                561727,
                987774,
                433451,
                999675,
                549721,
                572838,
                641614,
                568993,
                625418,
                672593,
                695453,
                152784,
                284575,
                625998,
                333997,
                487782,
                928146,
                118999,
                676914,
                197271,
                392551,
                685727,
                965921,
                199589,
                611753,
                655937,
                334565,
                777152,
                616165,
                975618,
                367243,
                635555,
                333497,
                732413,
                883899,
                156767,
                262672,
                779297,
                458982,
                477275,
                999999]

    for i in range (num_students):
        palabra = random.randint(1,10)
        for j in range (5):
            print(f'({palabra + (palabra - 1)*j},{students[i]}),')


if __name__ == "__main__":
    #for i in range (100):
        #print(f"UPDATE Estudiante SET Estudiante_id = {generate_number()} WHERE Estudiante_id = {i+1};")
    #for i in range(1, 187):
        #create_cursos(i)
    #create_dias_asignatura(930)
    give_students_words(101)