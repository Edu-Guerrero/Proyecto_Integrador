INSERT INTO Asignatura (Asignatura_id, Nombre, Descripcion, Carrera_id, Categoria_id, Nota_id, Numero, Creditos, Grupo_Prerequisito_id) 
VALUES
#Malla Computacion
(1, 'Escritura Academica', ' Esta asignatura se centra en desarrollar habilidades avanzadas de redacción académica. 
Los estudiantes aprenderán a estructurar ensayos, realizar investigaciones y usar correctamente citas y 
referencias bibliográficas. También se abordan técnicas para mejorar la claridad y coherencia en los escritos. 
Se enfoca en la creación de textos formales y académicos. El curso es esencial para presentar trabajos de 
investigación de alta calidad.', 49, 13, 3, 1001, 3, NULL),

(2, 'Taller de Ing. Cs. Computación', 'En esta asignatura se imparten conocimientos prácticos sobre el desarrollo
 de proyectos en el campo de la ingeniería de software. Los estudiantes trabajarán en equipos para diseñar, 
 implementar y probar soluciones a problemas reales usando herramientas de programación. El taller también aborda 
 metodologías ágiles y el ciclo de vida del desarrollo de software. Se fomenta el uso de mejores prácticas de 
 codificación y documentación. Los proyectos involucran la integración de conocimientos teóricos en escenarios 
 prácticos.', 31, 4, 3, '1001', 3, NULL),

(3, 'Cálculo Diferencial + Ej', 'Este curso introduce los conceptos fundamentales del cálculo diferencial, como 
límites, derivadas y aplicaciones de la derivada en problemas de optimización y análisis de funciones. 
Se complementa con ejercicios prácticos para aplicar los conceptos. Es esencial en la formación de ingenieros.', 38, 1, 3, '1201', 3, NULL),

(4, 'Química General 1 +Lab/Ej', 'Este curso cubre los principios básicos de la química, como la estructura
 atómica, enlaces químicos y reacciones. Incluye experimentos de laboratorio para reforzar los conceptos y 
 desarrollar habilidades experimentales. Proporciona una base sólida en química.', 36, 4, 3, '1003', 3, NULL),

(5, 'Cosmos', 'Este curso estudia el universo desde la formación de estrellas y galaxias hasta las teorías 
que explican su origen. Incluye la exploración de fenómenos astronómicos y un análisis crítico de las teorías
 cosmológicas actuales. Invita a reflexionar sobre nuestro lugar en el cosmos.', 6, 13, 3, '1002', 3, NULL),

(6, 'Inglés Nivel 1', 'Este curso introduce a los estudiantes a los conceptos fundamentales del inglés, 
enfocándose en habilidades básicas de comunicación. Se cubren aspectos de gramática, vocabulario y 
comprensión oral, con actividades prácticas para mejorar la capacidad de leer y escribir en inglés.', 50, 14, 3, 
'0001', 0, NULL),

(7, 'Inglés Nivel 2', 'Continuación del curso de nivel 1, este curso profundiza en las estructuras gramaticales
 más complejas y expande el vocabulario. Se introducen lecturas más avanzadas y se practica la conversación
  para mejorar la fluidez y comprensión.', 50, 14, 3, '0002', 0, NULL),

(8, 'Programación en C++ +Ej', 'Este curso cubre los fundamentos de la programación en C++, incluyendo conceptos
 como estructuras de control, funciones, arreglos y punteros. Se refuerza el aprendizaje a través de ejercicios
  prácticos para implementar programas básicos en C++.', 31, 4, 3, '1101', 3, NULL),

(9, 'Cálculo Integral + Ej', 'Este curso continúa con los temas de cálculo diferencial, introduciendo técnicas 
de integración, teoremas fundamentales y aplicaciones de la integral. Incluye ejercicios prácticos para aplicar 
estos conceptos a problemas reales.', 38, 1, 3, '1202', 3, NULL),

(10, 'Autoconocimiento', 'Un curso dedicado a la exploración personal y el desarrollo de habilidades 
introspectivas. Los estudiantes aprenderán sobre teorías del autoconcepto, la gestión emocional y el crecimiento 
personal, con un enfoque práctico en el autodescubrimiento.', 6, 13, 3, '1001', 3, NULL),

(11, 'Ser y Cosmos', 'Curso que examina las interacciones entre el ser humano y el universo. Se exploran temas 
de filosofía, cosmología y existencia desde una perspectiva interdisciplinaria, fomentando la reflexión crítica.',
 6, 13, 3, '2001', 3, NULL),

(12, 'Inglés Nivel 3', 'Avanzando en la complejidad, este curso refuerza las habilidades lingüísticas con énfasis 
en la escritura académica, el análisis de textos y la mejora de la pronunciación. Incluye tareas de conversación 
y redacción más elaboradas.', 50, 14, 6, '0003', 0, NULL),

(13, 'Inglés Nivel 4', 'Último nivel del ciclo básico de inglés, donde los estudiantes desarrollan habilidades 
para debatir temas complejos, escribir ensayos formales y realizar presentaciones en inglés. El curso prepara a 
los estudiantes para niveles más avanzados de competencia.', 50, 14, 6, '0004', 0, NULL),

(14, 'Programación Avanzada en C++', 'Curso avanzado en el lenguaje de programación C++, donde se profundizan 
temas como estructuras de datos dinámicas, programación orientada a objetos y manejo de memoria. Se trabaja con 
ejemplos y proyectos más complejos.', 31, 4, 3, '2102', 3, NULL),

(15, 'Matemáticas Discretas', 'Introducción a conceptos fundamentales de matemáticas discretas como teoría de 
conjuntos, grafos, algoritmos y combinatoria. Se estudian aplicaciones en informática y otras áreas relacionadas.',
 38, 1, 3, '2004', 3, NULL),

(16, 'Introducción a la Economía', 'Curso que proporciona una visión general de los principios de la economía, 
abarcando temas como oferta, demanda, mercados, y sistemas económicos. Se analiza cómo estos conceptos afectan 
la toma de decisiones en los niveles personal y empresarial.', 19, 2, 3, '1001', 3, NULL),

(17, 'Física para Ingeniería 1 +Lab/Ej', 'Este curso introduce los principios de la física aplicados a la 
ingeniería, cubriendo temas como la mecánica clásica, cinemática, y dinámica. Incluye un componente de laboratorio 
para aplicar los conocimientos teóricos a experimentos prácticos.', 23, 1, 3, '2701', 3, NULL),

(18, 'Cálculo Vectorial', 'Este curso aborda el cálculo en varias variables, incluyendo la diferenciación e 
integración de funciones vectoriales. Se estudian conceptos como campos vectoriales, integrales de línea y de 
superficie, con aplicaciones en física e ingeniería.', 38, 1, 3, '2203', 3, NULL),

(19, 'Inglés Nivel 5', 'Curso avanzado de inglés que se centra en el desarrollo de habilidades comunicativas en 
contextos más especializados. Los estudiantes participan en discusiones, debates y presentaciones formales sobre 
temas complejos. Se enfatiza la fluidez y precisión en la comunicación, así como la capacidad de argumentar y 
defender puntos de vista de manera efectiva.', 50, 14, 6, '0005', 0, NULL),

(20, 'Inglés Nivel 6', 'Este curso finaliza la serie de niveles de inglés, preparando a los estudiantes para 
comunicarse con fluidez en situaciones académicas y profesionales. Incluye tareas avanzadas de escritura, 
análisis de textos y presentaciones formales. Los estudiantes desarrollan habilidades para redactar informes 
detallados, realizar investigaciones académicas y participar en discusiones profesionales.',
 50, 14, 6, '0006', 0, NULL),

(21, 'Programación de Apps', 'Este curso enseña el diseño y desarrollo de aplicaciones móviles. Los 
estudiantes aprenden a programar interfaces de usuario, gestionar bases de datos móviles y optimizar la
 experiencia del usuario en entornos móviles. Se cubren temas como la integración de servicios web, el 
 uso de APIs y la implementación de características avanzadas como notificaciones push y almacenamiento 
 en la nube.', 31, 4, 3, '2103', 3, NULL),

(22, 'Álgebra Lineal 1 +Ej', 'Introducción a los conceptos básicos de álgebra lineal, incluyendo matrices, 
determinantes, vectores y espacios vectoriales. Se incluyen ejercicios prácticos para aplicar estos conceptos 
a problemas de ingeniería y ciencias. Los estudiantes aprenderán a resolver sistemas de ecuaciones lineales, 
realizar transformaciones lineales y comprender la teoría de espacios vectoriales.', 38, 1, 3, '1401', 3, NULL),

(23, 'Física para Ingeniería 2 +Lab/Ej', 'Continuación del curso de Física para Ingeniería 1, este curso cubre 
temas como electromagnetismo, circuitos eléctricos y ondas. Incluye un componente de laboratorio para la 
aplicación práctica de los conceptos teóricos. Los estudiantes realizarán experimentos para entender el 
comportamiento de los circuitos eléctricos, el campo magnético y las propiedades de las ondas.',
 23, 1, 3, '2702', 3, NULL),

(24, 'Aprendizaje y Servicio PASEC', 'Este curso combina teoría y práctica a través del aprendizaje basado 
en servicio comunitario. Los estudiantes aplican sus conocimientos académicos en proyectos de impacto social,
 desarrollando habilidades de liderazgo y responsabilidad social. Se fomenta la reflexión crítica sobre las
  necesidades de la comunidad y la implementación de soluciones sostenibles.', 51, 13, 3, '2000', 3, NULL),

(25, 'Cultura Gastronómica', 'Un curso que explora la historia y evolución de la gastronomía a nivel mundial.
 Se estudian las influencias culturales y sociales sobre la cocina, con énfasis en la gastronomía de diferentes
  regiones del mundo. Los estudiantes analizarán la relación entre la comida y la identidad cultural, así como 
  las tendencias actuales en la gastronomía global.', 24, 9, 6, '0010', 1, NULL),

(26, 'Electrónica Básica +Lab', 'Curso introductorio a los principios de la electrónica. Se estudian circuitos, 
componentes electrónicos y su aplicación en dispositivos básicos. El laboratorio permite experimentar con 
circuitos simples y su análisis. Los estudiantes aprenderán a diseñar y construir circuitos electrónicos básicos, 
comprender el funcionamiento de componentes como resistencias, capacitores y transistores, y utilizar herramientas
 de medición electrónica.', 32, 4, 3, '2001', 3, NULL),

(27, 'Estructuras de Datos', 'Este curso cubre la implementación y análisis de estructuras de datos como listas, 
pilas, colas, árboles y grafos. Los estudiantes aplican estos conceptos en proyectos de programación para optimizar 
el rendimiento de algoritmos. Se enfatiza la importancia de elegir la estructura de datos adecuada para diferentes 
tipos de problemas y se incluyen estudios de caso para ilustrar aplicaciones prácticas.', 31, 4, 3, '3002', 3, NULL),

(28, 'Probabilidad y Estadística +Ej', 'Curso que introduce los conceptos fundamentales de probabilidad y 
estadística, con aplicaciones en ingeniería y ciencias. Los ejercicios prácticos refuerzan el análisis de 
datos y la interpretación de resultados estadísticos. Se cubren temas como distribuciones de probabilidad, 
pruebas de hipótesis, regresión y análisis de varianza, proporcionando una base sólida para el análisis de datos.', 38, 1, 3, '2008', 3, NULL),

(29, 'Teoría de la Computación', 'Este curso cubre los fundamentos teóricos de la computación, incluyendo 
autómatas, lenguajes formales, gramáticas y la teoría de la complejidad. Los estudiantes desarrollan una 
comprensión profunda de los límites de lo computable. Se exploran temas avanzados como la decidibilidad, 
la reducibilidad y las clases de complejidad, preparando a los estudiantes para enfrentar problemas complejos en 
la computación.', 31, 4, 3, '3005', 3, NULL),

(31, 'Programación Avanzada de Apps', 'Este curso se enfoca en el desarrollo avanzado de aplicaciones móviles,
 cubriendo técnicas como la programación en múltiples plataformas, seguridad móvil y optimización del rendimiento.
    Incluye proyectos prácticos donde los estudiantes diseñan y desarrollan aplicaciones complejas, implementando 
    características avanzadas como notificaciones push, integración con servicios web y almacenamiento en la nube.', 31, 4, 3, '3104', 3, NULL),

(32, 'Organización de Computadores', 'El curso explora los componentes y la arquitectura interna de los 
computadores, incluyendo memoria, procesadores, y buses. Los estudiantes aprenden a optimizar y diseñar sistemas 
de hardware eficientes. Se abordan temas como la arquitectura de conjunto de instrucciones (ISA), la jerarquía de 
memoria y la interconexión de componentes, proporcionando una comprensión integral del funcionamiento interno de 
los computadores.', 31, 4, 3, '3004', 3, NULL),

(33, 'Emprendimiento', 'Este curso ofrece las bases para la creación de nuevos negocios. Los estudiantes aprenden
 sobre planificación empresarial, financiamiento, innovación y el proceso de llevar una idea al mercado. Se 
 incluyen estudios de caso de startups exitosas y se fomenta el desarrollo de un plan de negocios completo, 
 abarcando desde la identificación de oportunidades hasta la estrategia de salida.', 1, 2, 3, '3002', 3, NULL),

(34, 'Diseño de Sistemas', 'Los estudiantes aprenden a diseñar sistemas complejos mediante el análisis de 
requerimientos, modelado de sistemas y prototipado. Se enfoca en la creación de sistemas eficientes, escalables 
y adaptables. El curso incluye el uso de herramientas de modelado y simulación, y se realizan proyectos en los 
que los estudiantes aplican los principios de diseño a problemas reales, desde la concepción hasta la implementación.', 31, 4, 3, '3003', 3, NULL),
(35, 'Inteligencia Artificial', 'Este curso introduce los conceptos clave de la inteligencia artificial, incluyendo
 algoritmos de búsqueda, aprendizaje automático, redes neuronales y procesamiento del lenguaje natural. Los 
 estudiantes explorarán aplicaciones prácticas de la IA en diversas áreas como la visión por computadora, el 
 procesamiento del lenguaje natural y la robótica. Se enfatiza el uso de herramientas y bibliotecas modernas para 
 implementar soluciones de IA.', 31, 4, 3, '4004', 3, NULL),

(36, 'Base de Datos', 'Se abordan los conceptos fundamentales del diseño y manejo de bases de datos, desde la 
normalización de tablas hasta el uso de SQL. Los estudiantes practican con bases de datos relacionales y no 
relacionales, y aprenden sobre la optimización de consultas, la gestión de transacciones y la seguridad de datos. 
El curso incluye proyectos prácticos para diseñar y gestionar bases de datos eficientes.', 31, 4, 3, '4002', 3, NULL),

(37, 'Aprendizaje Automático', 'Este curso profundiza en las técnicas de aprendizaje automático, incluyendo 
modelos supervisados, no supervisados y redes neuronales. Los estudiantes implementan algoritmos de clasificación
 y predicción en proyectos prácticos. Se cubren temas avanzados como el aprendizaje profundo, el procesamiento de 
 grandes volúmenes de datos y la evaluación de modelos. El curso prepara a los estudiantes para aplicar técnicas 
 de aprendizaje automático en problemas del mundo real.', 31, 4, 3, '4002', 3, NULL),

(38, 'Redes +Lab', 'Un curso teórico y práctico sobre redes de computadores. Se cubren protocolos de red, 
arquitectura de Internet, enrutamiento y seguridad en redes, con un componente de laboratorio para implementaciones.
 Los estudiantes aprenden a configurar y gestionar redes, solucionar problemas de conectividad y aplicar medidas 
 de seguridad para proteger la infraestructura de red. El curso incluye estudios de caso y proyectos prácticos.', 
 31, 4, 3, '4005', 3, NULL),

(39, 'Sistemas Operativos', 'Los estudiantes aprenden los principios y estructuras de los sistemas operativos, 
incluyendo la gestión de procesos, memoria, almacenamiento y seguridad. Se incluye una perspectiva práctica de 
la administración de sistemas. El curso cubre temas como la concurrencia, la planificación de procesos, la gestión 
de memoria y el sistema de archivos. Los estudiantes también trabajan con sistemas operativos reales para 
desarrollar habilidades prácticas en administración y configuración.', 31, 4, 3, '4003', 3, NULL),

(40, 'Proyectos: Gerencia y Análisis', 'Este curso cubre la planificación y gestión de proyectos en el ámbito 
de la ingeniería y computación. Los estudiantes desarrollan habilidades en análisis de requerimientos, estimación 
de costos y gestión de riesgos. Se abordan metodologías de gestión de proyectos como Agile y Scrum, y se utilizan 
herramientas de software para planificar y monitorear proyectos. El curso incluye estudios de caso y proyectos 
prácticos para aplicar los conceptos aprendidos.', 34, 4, 3, '4011', 3, NULL),

(41, 'Práctica Pre-Profesional PASEM', 'Este curso permite a los estudiantes adquirir experiencia laboral en un 
entorno profesional relacionado con su campo de estudio, aplicando los conocimientos académicos en proyectos 
reales. Los estudiantes trabajan en empresas o instituciones, desarrollando habilidades prácticas y profesionales. 
El curso incluye la elaboración de un informe final y una presentación sobre la experiencia adquirida, destacando 
los logros y aprendizajes.', 52, 13, 6, '4000', 5, NULL),
(42, 'Coloquios', 'Un espacio para la reflexión y discusión académica en el que los estudiantes presentan y debaten
 sobre temas de interés actual en su campo de estudio. Se fomenta la participación activa y crítica. Los coloquios 
 también incluyen la participación de expertos invitados que comparten sus conocimientos y experiencias, 
 enriqueciendo el aprendizaje de los estudiantes.', 53, 4, 6, '0001', 1, NULL),

(43, 'Seguridad Informática', 'Se estudian los principios de la seguridad en sistemas informáticos, incluyendo 
criptografía, autenticación, control de acceso y seguridad en redes. Los estudiantes aplican técnicas de protección
 y detección de intrusiones. El curso también aborda la gestión de riesgos y la implementación de políticas de 
 seguridad para proteger la información y los sistemas contra amenazas y vulnerabilidades.', 31, 4, 3, '5006', 3, NULL),

(44, 'Minería de Datos', 'Este curso enseña las técnicas para extraer conocimiento a partir de grandes volúmenes de
 datos. Los estudiantes trabajan con algoritmos de clasificación, clustering y análisis de datos para resolver 
 problemas reales. Se incluyen estudios de caso y proyectos prácticos que permiten a los estudiantes aplicar 
 las técnicas aprendidas en situaciones del mundo real, mejorando su capacidad para tomar decisiones basadas en 
 datos.', 31, 4, 3, '5002', 3, NULL),

(45, 'Aplicaciones Distribuidas', 'El curso cubre el diseño y desarrollo de aplicaciones distribuidas, donde 
múltiples sistemas interactúan a través de redes. Los estudiantes aprenden a implementar y gestionar aplicaciones
 escalables y seguras. Se abordan temas como la comunicación entre procesos, la sincronización, la tolerancia a 
 fallos y la seguridad en sistemas distribuidos, proporcionando una comprensión integral de los desafíos y 
 soluciones en este campo.', 31, 4, 3, '5001', 3, NULL),

(46, 'Proyecto Integrador CMP', 'El proyecto final del programa de computación, donde los estudiantes aplican 
sus conocimientos en el desarrollo de un sistema completo que resuelva un problema real o empresarial, integrando
 diversas áreas del campo. Los estudiantes trabajan en equipos para planificar, diseñar, implementar y evaluar 
 su proyecto, desarrollando habilidades de gestión de proyectos, trabajo en equipo y comunicación efectiva. 
 El proyecto culmina con una presentación formal y una demostración del sistema desarrollado.', 31, 4, 3, '5992', 5, NULL);

(47, 'Matematica Empresarial +Ej', 'Curso que abarca temas de matemáticas aplicados al ámbito empresarial, como 
álgebra, funciones y análisis financiero. Incluye ejercicios prácticos para reforzar los conceptos teóricos. 
Los estudiantes aprenderán a utilizar herramientas matemáticas para resolver problemas financieros y empresariales, 
desarrollando habilidades analíticas y de toma de decisiones.', 38, 1, 3, '1009', 3, NULL),

(48, 'Conceptos y Tecnicas 1', 'Este curso introduce a los estudiantes a conceptos fundamentales y técnicas de 
cocina, incluyendo habilidades básicas de preparación de alimentos y el uso de herramientas culinarias. 
Se enfoca en la seguridad alimentaria, la higiene en la cocina y la correcta manipulación de ingredientes. 
Los estudiantes practicarán técnicas de corte, cocción y presentación de platos básicos.', 24, 9, 3, '1101', 3, NULL),

(49, 'Principios de Administracion', 'Un curso introductorio que cubre los principios esenciales de la 
administración, incluyendo planificación, organización, liderazgo y control en un entorno empresarial. 
Los estudiantes aprenderán sobre la toma de decisiones estratégicas, la gestión de recursos humanos y la 
implementación de políticas organizacionales. Se incluyen estudios de caso y ejercicios prácticos para 
aplicar los conceptos aprendidos.', 1, 2, 3, '1001', 3, NULL),

(50, 'Panaderia', 'Los estudiantes aprenden los principios básicos de la panadería, incluyendo la preparación
 de diferentes tipos de panes, masas fermentadas y técnicas de horneado. Se abordan temas como la selección 
 de ingredientes, el proceso de fermentación y la decoración de productos de panadería. El curso incluye 
 sesiones prácticas donde los estudiantes elaboran una variedad de panes y productos horneados.', 24, 9, 3, '2002', 3, NULL),

(51, 'Nutricion Humana +Lab', 'Este curso explora los fundamentos de la nutrición humana, con un componente 
práctico en el laboratorio para el análisis de dietas y evaluación de necesidades nutricionales. Los estudiantes 
aprenderán sobre los nutrientes esenciales, la digestión y el metabolismo, así como la planificación de dietas 
equilibradas. El laboratorio permite a los estudiantes realizar análisis de alimentos y evaluar el estado 
nutricional de diferentes poblaciones.', 41, 3, 3, '1001', 3, NULL),

(52, 'Introduccion a la Hospitalidad', 'Los estudiantes se familiarizan con los principios fundamentales de 
la industria de la hospitalidad, incluyendo el servicio al cliente, gestión hotelera y tendencias actuales del
 sector. Se abordan temas como la historia de la hospitalidad, la importancia de la calidad del servicio y las 
 habilidades necesarias para tener éxito en este campo. El curso también incluye estudios de caso y visitas a 
 establecimientos de hospitalidad para proporcionar una comprensión práctica de la industria.', 26, 6, 3, '1001', 3, NULL),

(53, 'Contabilidad Empresarial', 'El curso cubre los principios básicos de la contabilidad financiera aplicada 
a las empresas, incluyendo el registro de transacciones, balance de cuentas y preparación de informes financieros.
 Los estudiantes aprenderán a interpretar estados financieros, realizar análisis financieros y comprender la 
 importancia de la contabilidad en la toma de decisiones empresariales. Se incluyen ejercicios prácticos y 
 estudios de caso para aplicar los conceptos aprendidos.', 22, 1, 3, '2002', 3, NULL),

(54, 'Conceptos y Tecnicas 2 +PRA', 'Continuación de Conceptos y Técnicas 1, este curso avanza en habilidades
 culinarias con un enfoque en la práctica intensiva, preparando platos más complejos. Los estudiantes aprenderán 
 técnicas avanzadas de cocina, presentación de platos y gestión de tiempo en la cocina. El curso incluye sesiones 
 prácticas donde los estudiantes aplican lo aprendido en situaciones de cocina real, mejorando sus habilidades 
 culinarias y su capacidad para trabajar bajo presión.', 24, 9, 3, '2102', 3, NULL),

(55, 'Practica Culinaria 1', 'Los estudiantes aplican técnicas culinarias básicas en un entorno práctico, aprendiendo
 a trabajar en equipo y a gestionar las operaciones de cocina. El curso se enfoca en la preparación de menús, la 
 organización de la cocina y la implementación de prácticas de higiene y seguridad. Los estudiantes también 
 desarrollan habilidades en la gestión de inventarios y el control de costos, preparando platos bajo la supervisión 
 de chefs experimentados.', 24, 9, 3, '1200', 3, NULL),

(56, 'Administracion de A & B', 'Este curso enseña los principios de administración de alimentos y bebidas en 
establecimientos de hospitalidad, cubriendo gestión de inventario, costos y control de calidad. Los estudiantes 
aprenderán a planificar menús, negociar con proveedores y gestionar el personal de servicio. Se incluyen estudios 
de caso y proyectos prácticos para aplicar los conceptos aprendidos en situaciones reales, mejorando la eficiencia 
y la calidad del servicio en establecimientos de alimentos y bebidas.', 26, 2, 3, '2001', 3, NULL),
(57, 'Carniceria', 'Se estudian técnicas de corte de carne, manejo de diferentes tipos de carne y métodos de 
preparación para la cocina profesional. Los estudiantes aprenderán a seleccionar, cortar y preparar carnes de 
manera eficiente y segura, utilizando herramientas especializadas. El curso también aborda la conservación y 
almacenamiento adecuado de los productos cárnicos.', 24, 9, 3, '2003', 3, NULL),

(58, 'Alta Cocina Ecuatoriana', 'Los estudiantes aprenden a preparar platos tradicionales ecuatorianos con un 
enfoque en técnicas de alta cocina y presentación moderna. Se exploran ingredientes autóctonos y se aplican 
técnicas culinarias avanzadas para realzar los sabores y la presentación de los platos. El curso incluye 
demostraciones prácticas y la creación de menús degustación.', 24, 9, 3, '3001', 3, NULL),

(59, 'Introduccion a la Economia', 'Curso básico que cubre los principios de la economía, incluyendo la oferta
 y demanda, microeconomía y macroeconomía, con aplicaciones prácticas en la vida cotidiana. Los estudiantes 
 aprenderán a analizar cómo las decisiones económicas afectan a individuos, empresas y gobiernos, y cómo 
 utilizar herramientas económicas para resolver problemas reales.', 19, 2, 3, '1001', 3, NULL),

(60, 'Introduccion al Marketing HSP', 'Introducción al marketing en la industria de la hospitalidad, cubriendo
 conceptos como la segmentación de mercado, estrategias de precios y promoción de servicios. Los estudiantes 
 desarrollarán habilidades para crear y ejecutar planes de marketing efectivos, utilizando estudios de caso y 
 proyectos prácticos para aplicar los conceptos aprendidos en situaciones reales.', 26, 6, 3, '2003', 3, NULL),

(61, 'Coloquios', 'Espacio de reflexión y discusión académica en el que se presentan temas actuales del 
campo de la hospitalidad y la gastronomía, promoviendo la participación activa. Los estudiantes tendrán la 
oportunidad de interactuar con expertos de la industria, compartir sus ideas y debatir sobre tendencias y 
desafíos actuales, enriqueciendo su comprensión del campo.', 26, 6, 3, '0001', 1, NULL),

(62, 'Alta Cocina Francesa', 'Los estudiantes aprenden las técnicas y recetas tradicionales de la cocina
 francesa, desde la preparación de salsas hasta la elaboración de platos emblemáticos. El curso incluye 
 demostraciones prácticas y sesiones de cocina donde los estudiantes aplican técnicas clásicas para crear 
 platos sofisticados. Se enfatiza la precisión y la atención al detalle en la presentación de los platos.', 
 24, 9, 3, '3005', 3, NULL),

(63, 'Pasteleria', 'Este curso enseña los fundamentos de la pastelería, incluyendo la preparación de tartas, 
galletas y otros productos de repostería fina. Los estudiantes aprenderán técnicas de horneado, decoración y 
presentación de postres, así como la selección y manejo adecuado de ingredientes para crear productos de alta 
calidad.', 24, 9, 3, '3003', 3, NULL),

(64, 'Servicio y Protocolo', 'Se estudian los principios del servicio al cliente en la industria de la hospitalidad, 
incluyendo las normas de protocolo y etiqueta en el servicio de alimentos y bebidas. Los estudiantes desarrollarán 
habilidades en la atención al cliente, la organización de eventos y la gestión de situaciones de servicio, 
asegurando una experiencia excepcional para los clientes.', 24, 9, 3, '2001', 3, NULL),

(65, 'Practica Culinaria 2', 'Curso práctico que permite a los estudiantes desarrollar habilidades avanzadas 
en la cocina, gestionando equipos y preparando platos sofisticados en un entorno profesional. Los estudiantes 
trabajarán en la planificación de menús, la ejecución de técnicas culinarias avanzadas y la gestión de la cocina 
bajo presión, mejorando su capacidad para liderar y colaborar en un equipo culinario.', 24, 9, 3, '3200', 3, NULL),

(66, 'Alta Cocina Mundial', 'Un recorrido por las principales tradiciones culinarias del mundo, donde los 
estudiantes aprenden a preparar platos de alta cocina de diversas culturas. El curso incluye la exploración de 
ingredientes exóticos, técnicas de cocina internacional y la creación de menús temáticos, proporcionando una 
comprensión profunda de la diversidad culinaria global.', 24, 9, 3, '4002', 3, NULL),

(67, 'Reposteria y Chocolateria', 'Este curso cubre las técnicas avanzadas en repostería y chocolatería, 
desde la creación de postres complejos hasta la manipulación del chocolate para productos gourmet. Los estudiantes 
aprenderán a trabajar con diferentes tipos de chocolate, crear decoraciones elaboradas y desarrollar habilidades 
en la presentación de postres de alta calidad.', 24, 9, 3, '3007', 3, NULL);

(68, 'Innovacion Culinaria', 'Este curso explora técnicas innovadoras y contemporáneas en la cocina, permitiendo
 a los estudiantes desarrollar nuevos enfoques y conceptos creativos. Se hace hincapié en la experimentación con
  ingredientes, texturas y sabores para proponer platos originales. Los estudiantes también aprenden a utilizar
   herramientas tecnológicas para la innovación culinaria. Finalmente, se fomenta la creación de menús vanguardistas
    y adaptables a tendencias globales.', 24, 9, 3, '4006', 3, NULL),

(69, 'Enologia y Cocteleria', 'Este curso se centra en el estudio profundo del vino, desde su producción hasta
 su correcta cata y maridaje con distintos alimentos. Además, incluye una introducción a la coctelería, donde
  los estudiantes aprenden las técnicas clásicas y modernas de preparación de cócteles. Se presta especial 
  atención a la historia y evolución de las bebidas espirituosas. Los alumnos desarrollan habilidades prácticas 
  en la mezcla y presentación de cócteles de autor.', 24, 9, 3, '4003', 3, NULL),

(70, 'Administracion de Eventos', 'El curso proporciona una visión integral de la planificación y gestión de 
eventos en la industria de la hospitalidad. Los estudiantes estudian desde la organización logística hasta el 
manejo de presupuestos y recursos humanos. Se abordan técnicas para la promoción y marketing de eventos exitosos,
 considerando la satisfacción del cliente. También incluye estudios de caso de eventos internacionales de gran escala
  para analizar sus dinámicas y gestión.', 26, 2, 3, '3002', 3, NULL),

(71, 'Gerencia Financiera HSP', 'Este curso aborda los aspectos financieros fundamentales de la gestión en la 
hospitalidad. Los estudiantes aprenden a desarrollar y analizar presupuestos, controlar costos, y realizar 
proyecciones financieras para negocios en el sector. También cubre la administración de ingresos y la toma de 
decisiones basadas en datos financieros. A lo largo del curso, los alumnos aplican herramientas de software 
para optimizar la rentabilidad en contextos reales.', 26, 6, 3, '4001', 3, NULL),

(72, 'Identidad Culinaria', 'El curso examina cómo la gastronomía refleja la identidad cultural de diversas 
regiones, con un enfoque en el análisis de tradiciones culinarias. Los estudiantes investigan el impacto de 
la globalización en la gastronomía local y las tendencias actuales que afectan el patrimonio culinario. A través
 de la investigación y el trabajo de campo, desarrollan proyectos que preservan o reinventan platos tradicionales.
  Además, se discuten temas relacionados con la sostenibilidad y la cultura alimentaria.', 24, 9, 3, '4992', 5, NULL);

