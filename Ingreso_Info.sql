-- Active: 1726172189649@@127.0.0.1@3306@proyectointegrador
USE ProyectoIntegrador;

-- Insert data into the Campus table
INSERT INTO Campus (Campus_id, Nombre) VALUES 
(1, 'Cumbaya'),
(2, 'Galapagos'),
(3, 'Estacion Tiputini');

-- Insertar los datos en la tabla Colegio
INSERT INTO Colegio (Colegio_id, Nombre, Abreviatura) VALUES
(1, 'Colegio de Administración de Empresas', 'CADE'),
(2, 'Colegio de Arquitectura y Diseño Interior', 'CADI'),
(3, 'Colegio de Ciencias Biológicas y Ambientales', 'COCIBA'),
(4, 'Colegio de Ciencias de la Salud', 'COCSA'),
(5, 'Colegio de Ciencias e Ingenierías', 'POLI'),
(6, 'Colegio de Ciencias Sociales y Humanidades', 'COCISOH'),
(7, 'Colegio de Comunicación y Artes Contemporáneas', 'COCOA'),
(8, 'Colegio de Economía', 'ECON'),
(9, 'Colegio de Hospitalidad, Arte Culinario y Turismo', 'CHAT'),
(10, 'Colegio de Jurisprudencia', 'JUR'),
(11, 'College of Music', 'COM');

INSERT INTO Dias (Dia_id, Abreviatura, Nombre) VALUES
(1, 'L', 'Lunes'),
(2, 'M', 'Martes'),
(3, 'I', 'Miércoles'),
(4, 'J', 'Jueves'),
(5, 'V', 'Viernes'),
(6, 'S', 'Sábado'),
(7, 'D', 'Domingo');

-- Insertar calificaciones en la tabla Notas
INSERT INTO Notas (Nota_id, Nota) VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D'),
(5, 'F'),
(6, 'P');

-- Insertar datos en la tabla Semestre
INSERT INTO Semestre (Semestre_id, Nombre) VALUES
(1, 'Primer Semestre'),
(2, 'Segundo Semestre'),
(3, 'Tercer Semestre'),
(4, 'Cuarto Semestre'),
(5, 'Quinto Semestre'),
(6, 'Sexto Semestre'),
(7, 'Séptimo Semestre'),
(8, 'Octavo Semestre'),
(9, 'Noveno Semestre'),
(10, 'Décimo Semestre')
(11, 'Undécimo Semestre'),
(12, 'Duodécimo Semestre');

-- Insertar edificios en la tabla Edificio
INSERT INTO Edificio (Edificio_id, Abreviatura, Nombre) VALUES
(1, 'MS', 'Miguel de Santiago'),
(2, 'A', 'Aristóteles'),
(3, 'S', 'Sócrates'),
(4, 'M', 'Mozart'),
(5, 'LZ', 'Lao Zi'),
(6, 'TM', 'Taller de metal'),
(7, 'H', 'Herbario'),
(8, 'CA', 'Coliseo Alexandros'),
(9, 'P', 'Pagoda'),
(10, 'G', 'Galileo'),
(11, 'N', 'Newton'),
(12, 'D', 'Darwin'),
(13, 'CB', 'Casa Blanca'),
(14, 'CT', 'La Casita Tomate'),
(15, 'CC', 'Casa Corona'),
(16, 'MX', 'Maxwell'),
(17, 'CO', 'Clínica Odontológica'),
(18, 'DV', 'Da Vinci'),
(19, 'C', 'Cicerón'),
(20, 'E', 'Einstein'),
(21, 'EE', 'Eugenio Espejo'),
(22, 'EP', 'Epicuro');

-- Insertar datos en la tabla Carrera
INSERT INTO Carrera (Carrera_id, Colegio_id, Abreviatura, Nombre) VALUES
(1, 1, 'ADM', 'Administracion de Empresas'),
(2, 1, 'ADG', 'Administracion de Empresas (Galapagos)'),
(3, 7, 'ANI', 'Animacion Digital'),
(4, 6, 'ANT', 'Antropologia'),
(5, 2, 'ARQ', 'Arquitectura'),
(6, 6, 'ART', 'Artes Liberales'),
(7, 7, 'VIS', 'Artes Visuales'),
(8, 7, 'MOD', 'Artes Visuales: Diseno de modas'),
(9, 3, 'BIO', 'Biologia'),
(10, 3, 'BTC', 'Biotecnologia'),
(11, 6, 'POL', 'Ciencias Politicas'),
(12, 7, 'CIN', 'Cine'),
(13, 11, 'CMC', 'Composicion para Medios Contemporaneos'),
(14, 7, 'COM', 'Comunicacion'),
(15, 10, 'DER', 'Derecho'),
(16, 2, 'DIN', 'Diseno de Interiores'),
(17, 7, 'DMI', 'Diseno de Medios Interactivos'),
(18, 7, 'DGC', 'Diseno Grafico: Diseno Comunicacional'),
(19, 8, 'ECO', 'Economia'),
(20, 6, 'EDU', 'Educacion'),
(21, 11, 'EMC', 'Ejecucion de Musica Contemporanea'),
(22, 1, 'FIN', 'Finanzas'),
(23, 5, 'FIS', 'Fisica'),
(24, 9, 'GAS', 'Gastronomia'),
(25, 3, 'GAG', 'Gestion Ambiental (Galapagos)'),
(26, 9, 'HOT', 'Hospitalidad y Hoteleria'),
(27, 5, 'AMB', 'Ingenieria Ambiental'),
(28, 5, 'CIV', 'Ingenieria Civil'),
(29, 5, 'AGR', 'Ingenieria en Agronomia'),
(30, 5, 'ALI', 'Ingenieria en Alimentos'),
(31, 5, 'CMP', 'Ingenieria en Ciencias de la Computacion'),
(32, 5, 'ELE', 'Ingenieria en Electronica y Automatizacion'),
(33, 5, 'MAC', 'Ingenieria en Matematicas Aplicadas y Computacion'),
(34, 5, 'IND', 'Ingenieria Industrial'),
(35, 5, 'MEC', 'Ingenieria Mecanica'),
(36, 5, 'QUI', 'Ingenieria Quimica'),
(37, 1, 'MKT', 'Marketing'),
(38, 5, 'MAT', 'Matematica'),
(39, 4, 'MED', 'Medicina'),
(40, 4, 'VET', 'Medicina Veterinaria'),
(41, 4, 'NUT', 'Nutricion y Dietetica'),
(42, 4, 'ODO', 'Odontologia'),
(43, 7, 'PER', 'Periodismo'),
(44, 11, 'PRM', 'Produccion Musical'),
(45, 6, 'PSI', 'Psicologia'),
(46, 6, 'PSC', 'Psicologia Clinica'),
(47, 7, 'PUB', 'Publicidad'),
(48, 6, 'RIN', 'Relaciones Internacionales');

INSERT INTO profesor (profesor_id, Nombre, correo) VALUES
(1, 'Alberto Cardenas Ruales', 'acardenas1@usfq.edu.ec'),
(2, 'Alberto Sanchez', 'asanchez@usfq.edu.ec'),
(3, 'Aleksandr Novikov', 'anovikov@usfq.edu.ec'),
(4, 'Alessandro Veltri', 'aveltri@usfq.edu.ec'),
(5, 'Alexander Rafael Hearn', 'ahearn@usfq.edu.ec'),
(6, 'Alfredo Jose Jijon Chiriboga', 'ajijon@usfq.edu.ec'),
(7, 'Alfredo Valarezo Garces', 'avalarezo@usfq.edu.ec'),
(8, 'Alvaro Daniel Villacres Lopez', 'avillacresl@usfq.edu.ec'),
(9, 'Alvaro Hugo Aleman Salvador', 'aaleman@usfq.edu.ec'),
(10, 'Andres Caicedo', 'acaicedo@usfq.edu.ec'),
(11, 'Andres Esteban Leon-Reyes', 'aeleon@usfq.edu.ec'),
(12, 'Andres Martinez-Moscoso', 'amartinez@usfq.edu.ec'),
(13, 'Andres Torres Salvador', 'atorres@usfq.edu.ec'),
(14, 'Angus Lyall', 'alyall@usfq.edu.ec'),
(15, 'Antonio Di Teodoro', 'nditeodoro@usfq.edu.ec'),
(16, 'Antonio Leon', 'aleon@usfq.edu.ec'),
(17, 'Bernardo Gutierrez', 'bgutierrezg@usfq.edu.ec'),
(18, 'Byron Toledo', 'btoledog@usfq.edu.ec'),
(19, 'Carlos A. Valle', 'cvalle@usfq.edu.ec'),
(20, 'Carlos Antonio Marin Vasconez', 'cmarin@usfq.edu.ec'),
(21, 'Carlos Barba', 'cbarbao@usfq.edu.ec'),
(22, 'Carlos Dominik Echeverria Kossak', 'cecheverria@usfq.edu.ec'),
(23, 'Carlos Fernando Mena Mena', 'cmena@usfq.edu.ec'),
(24, 'Carlos Jose Jimenez Mosquera', 'cjimenez@usfq.edu.ec'),
(25, 'Carlos Miquel Zurita', 'cmiquel@usfq.edu.ec'),
(26, 'Carlos Ramiro Espinosa Fernandez de Cordova', 'cespinosaf@usfq.edu.ec'),
(27, 'Carlos Suarez', 'csuarez@usfq.edu.ec'),
(28, 'Cesar Zambrano', 'czambrano@usfq.edu.ec'),
(29, 'Christian Rafael Parreno Roldan', 'cparrenor@usfq.edu.ec'),
(30, 'Christopher Wells Minster', 'cminster@usfq.edu.ec'),
(31, 'Damian Ramia Yepez', 'dramia@usfq.edu.ec'),
(32, 'Daniel Bustillos Costales', 'dbustillosc@usfq.edu.ec'),
(33, 'Daniel Fellig Goldvechmiedt', 'dfellig@usfq.edu.ec'),
(34, 'Daniel Ricardo Garzon Chavez', 'dgarzonc@usfq.edu.ec'),
(35, 'Daniel Riofrio', 'driofrioa@usfq.edu.ec'),
(36, 'Daniel Toledo', 'dtoledo@usfq.edu.ec'),
(37, 'Dario Niebieskikwiat', 'dniebieskikwiat@usfq.edu.ec'),
(38, 'Darwin Homero Simbana Lincango', 'dhsimbana@usfq.edu.ec'),
(39, 'David Alexis Egas Proano', 'degas@usfq.edu.ec'),
(40, 'David Fernando Hervas Ortega', 'dhervas@usfq.edu.ec'),
(41, 'David Roberto Escudero Guevara', 'descudero@usfq.edu.ec'),
(42, 'Dennis Cazar Ramirez', 'dcazar@usfq.edu.ec'),
(43, 'Diego Benitez', 'dbenitez@usfq.edu.ec'),
(44, 'Diego Bernardo Davalos Grijalva', 'bdavalos@usfq.edu.ec'),
(45, 'Diego Patricio Gangotena Gonzalez', 'dgangotena@usfq.edu.ec'),
(46, 'Diego Patricio Oleas Serrano', 'doleas@usfq.edu.ec'),
(47, 'Diego Quiroga Ferri', 'dquiroga@usfq.edu.ec'),
(48, 'Diego Rodolfo Paez-Rosas', 'dpaez@usfq.edu.ec'),
(49, 'Edgar Carrera Jarrin', 'ecarrera@usfq.edu.ec'),
(50, 'Edison Ivan Cevallos Miranda', 'eicevallosm@usfq.edu.ec'),
(51, 'Eduardo Alba', 'ealba@usfq.edu.ec'),
(52, 'Eduardo Javier Holguin Weber', 'eholguin@usfq.edu.ec'),
(53, 'Edwin Javier Contreras Escalona', 'econtrerase@usfq.edu.ec'),
(54, 'Elkin Alexis Hidrobo Portilla', 'ahidrobo@usfq.edu.ec'),
(55, 'Emiliano Gil Blanco', 'egilb@usfq.edu.ec'),
(56, 'Eric Samson', 'esamson@usfq.edu.ec'),
(57, 'Ernesto Andres Quintana Vasconez', 'equintana@usfq.edu.ec'),
(58, 'Ernesto Contreras', 'econtreras@usfq.edu.ec'),
(59, 'Ernesto Medina Dagger', 'emedina@usfq.edu.ec'),
(60, 'Esteban Suarez Robalino', 'esuarez@usfq.edu.ec'),
(61, 'Fabian Mauricio Alberto Luzuriaga del Castillo', 'mluzuriaga@usfq.edu.ec'),
(62, 'Farith Simon Campana', 'fsimon@usfq.edu.ec'),
(63, 'Fausto Vinicio Pasmay Ramos', 'fpasmay@usfq.edu.ec'),
(64, 'Felipe Jose Palacios Sierra', 'fjpalacios@usfq.edu.ec'),
(65, 'Fernando Astudillo', 'fjastudillo@usfq.edu.ec'),
(66, 'Fernando Ortega Perez', 'fortega@usfq.edu.ec'),
(67, 'Fernando Torres Jaramillo', 'ftorresj@usfq.edu.ec'),
(68, 'Florencio Delgado', 'fdelgado@usfq.edu.ec'),
(69, 'Francisco Carvajal Larenas', 'fcarvajal@usfq.edu.ec'),
(70, 'Francisco Javier Lara Marrero', 'flara@usfq.edu.ec'),
(71, 'Frank Alexis', 'falexis@usfq.edu.ec'),
(72, 'Fredy R. Grefa', 'fgrefaa@usfq.edu.ec'),
(73, 'Fuad Francisco Teran Misle', 'fteran@usfq.edu.ec'),
(74, 'Gabriel Andrade Pazmino', 'gandradep@usfq.edu.ec'),
(75, 'Gabriel Antonio Trueba Piedrahita', 'gtrueba@usfq.edu.ec'),
(76, 'Gabriel Ferreyra', 'gferreyra@usfq.edu.ec'),
(77, 'Gabriel Ignacio Montufar Gangotena', 'gmontufar@usfq.edu.ec'),
(78, 'Giovanni Rosania', 'grosania@usfq.edu.ec'),
(79, 'Gonzalo Rivas-Torres', 'grivast@usfq.edu.ec'),
(80, 'Guillermo Eduardo Hernandez Bustos', 'ghernandez@usfq.edu.ec'),
(81, 'Gustavo Cusot', 'gcusot@usfq.edu.ec'),
(82, 'Gustavo Fierro Carrion', 'gfierroc@usfq.edu.ec'),
(83, 'Hernan Patricio Calderon Carvallo', 'hcalderon@usfq.edu.ec'),
(84, 'Howard Ira Taikeff Sorkin', 'htaikeff@usfq.edu.ec'),
(85, 'Hugo Alberto Valdebenito Milling', 'hvaldebenito@usfq.edu.ec'),
(86, 'Hugo Burgos Yanez', 'hburgos@usfq.edu.ec'),
(87, 'Hugo Cahuenas Munoz', 'hcahuenas@usfq.edu.ec'),
(88, 'I-Li Huang Hsu', 'ihuang@usfq.edu.ec'),
(89, 'Israel Eduardo Cevallos Vasconez', 'icevallosv@usfq.edu.ec'),
(90, 'Ivan Enrique Hidrobo Cueva', 'ehidrobo@usfq.edu.ec'),
(91, 'Ivan Patricio Burbano Riofrio', 'iburbano@usfq.edu.ec'),
(92, 'Ivan Tomas Palacios Leon', 'tpalacios@usfq.edu.ec'),
(93, 'Jaime Alfredo Costales Penaherrera', 'jcostales@usfq.edu.ec'),
(94, 'Jaime Eduardo Lopez Andrade', 'jlopez@usfq.edu.ec'),
(95, 'Jaime Francisco Guerra Montalvo', 'jguerra'),
(96, 'Jaime Oswaldo Patricio Guevara Aguirre', 'jguevara@usfq.edu.ec'),
(97, 'Jaime Vintimilla Saldana', 'jvintimilla@usfq.edu.ec'),
(98, 'Javier Roberto Arano', 'jaranof@usfq.edu.ec'),
(99, 'Jesus Enrique Estevez Monagas', 'jestevez@usfq.edu.ec'),
(100, 'Jhonnie Francisco Xavier Diaz Franco', 'fdiaz@usfq.edu.ec'),
(101, 'John Alejandro Dunn Insua', 'jdunn@usfq.edu.ec'),
(102, 'John Robert Skukalek', 'jskukalek@usfq.edu.ec'),
(103, 'Jonathan Raymond Guillemot', 'jrguillemot@usfq.edu.ec'),
(104, 'Jorge Augusto Maldonado Gangotena', 'amaldonado@usfq.edu.ec'),
(105, 'Jorge Bolivar Silva Hidalgo', 'jsilva@usfq.edu.ec'),
(106, 'Jorge David Balladares Pesantes', 'jballadares@usfq.edu.ec'),
(107, 'Jorge Garcia', 'jgarcia@usfq.edu.ec'),
(108, 'Jorge Gomez Tejada', 'jgomezt@usfq.edu.ec'),
(109, 'Jorge Guillermo Cepeda Andrade', 'gcepeda@usfq.edu.ec'),
(110, 'Jorge Luis Mora Hernandez', 'jmora@usfq.edu.ec'),
(111, 'Jorge Ricardo Flores Moyano', 'rflores@usfq.edu.ec'),
(112, 'Jose David Larrea Luna', 'jdlarrea@usfq.edu.ec'),
(113, 'Jose Francisco Alvarez Barreto', 'jalvarezb@usfq.edu.ec'),
(114, 'Jose Julio Cisneros Merino', 'jcisneros@usfq.edu.ec'),
(115, 'Jose Miguel Alvarez Suarez', 'jalvarez@usfq.edu.ec'),
(116, 'Jose Miguel Mantilla Salgado', 'jmantilla@usfq.edu.ec'),
(117, 'Jose Moreno Amores', 'jmoreno@usfq.edu.ec'),
(118, 'Jose Ramon Mora', 'jrmora@usfq.edu.ec'),
(119, 'Joseph Houlberg Silva', 'jhoulberg@usfq.edu.ec'),
(120, 'Juan Carlos Collantes Vela', 'jcollantes@usfq.edu.ec'),
(121, 'Juan Carlos Prado Rodriguez', 'jprado@usfq.edu.ec'),
(122, 'Juan Carlos Valdivieso', 'jcvaldivieso@usfq.edu.ec'),
(123, 'Juan Diego Fonseca Ashton', 'jfonseca@usfq.edu.ec'),
(124, 'Juan Elias Erazo Solines', 'jerazo@usfq.edu.ec'),
(125, 'Juan Jose Guadalupe Lopez', 'jguadalupe@usfq.edu.ec'),
(126, 'Juan Manuel Guayasamin Ernest', 'jmguayasamin@usfq.edu.ec'),
(127, 'Juan Pablo Aguilar Andrade', 'jaguilar@usfq.edu.ec'),
(128, 'Juan Pablo Munoz-Perez', 'jmunozp@usfq.edu.ec'),
(129, 'Juan Pablo Viteri', 'jviteri@usfq.edu.ec'),
(130, 'Juan Sebastian Proano Aviles', 'jsproano@usfq.edu.ec'),
(131, 'Julio Cesar Ibarra Fiallo', 'jibarra@usfq.edu.ec'),
(132, 'Julio Fernando Ortega Andrade', 'jortega@usfq.edu.ec'),
(133, 'Kelly Swing', 'kswing@usfq.edu.ec'),
(134, 'Leo Zurita Arthos', 'lzurita@usfq.edu.ec'),
(135, 'Luis Caiza', 'lcaiza@usfq.edu.ec'),
(136, 'Luis Enrique Wong Reyna', 'ewong@usfq.edu.ec'),
(137, 'Luis Miguel Procel Moya', 'lprocel@usfq.edu.ec'),
(138, 'Luis Parraguez Ruiz', 'lparraguez@usfq.edu.ec'),
(139, 'Luis Renato Leon Villalba', 'rleon@usfq.edu.ec'),
(140, 'Luis Rene Calderon Salmeron', 'lrcalderon@usfq.edu.ec'),
(141, 'Luis Ricardo Fernando Mantilla Anderson', 'lmantilla@usfq.edu.ec'),
(142, 'Luis Rincon', 'lrincon@usfq.edu.ec'),
(143, 'Luis Servando Espin Torres', 'lespin@usfq.edu.ec'),
(144, 'Manuel Esteban Utreras Zabala', 'eutreras@usfq.edu.ec'),
(145, 'Manuel Garcia Albornoz', 'mgarciaa@usfq.edu.ec'),
(146, 'Marcelino Garcia Sedano', 'mgarcias@usfq.edu.ec'),
(147, 'Marcelo Banderas Braga', 'mbanderas@usfq.edu.ec'),
(148, 'Marco Francisco Leon Dunia', 'mleond@usfq.edu.ec'),
(149, 'Marcos Di Stefano Ciabatella', 'mdistefanoc@usfq.edu.ec'),
(150, 'Marcos Fernando Gonzalez Gomez', 'mfgonzalez@usfq.edu.ec'),
(151, 'Mario Caviedes Cepeda', 'mcaviedes@usfq.edu.ec'),
(152, 'Mario Fernando Viteri Vela', 'mviteriv@usfq.edu.ec'),
(153, 'Martin Eduardo Villacis Pastor', 'evillacis@usfq.edu.ec'),
(154, 'Matthew King Dolloff', 'mkdolloff@usfq.edu.ec'),
(155, 'Mauricio Cepeda', 'mcepeda@usfq.edu.ec'),
(156, 'Mauricio David Ochoa Solis', 'mochoa@usfq.edu.ec'),
(157, 'Mauricio Maldonado Munoz', 'mmaldonadom@usfq.edu.ec'),
(158, 'Michael Douglas Hill', 'mhill@usfq.edu.ec'),
(159, 'Michele Jose Maria Ugazzi Betancourt', 'mugazzi@usfq.edu.ec'),
(160, 'Miguel Angel Mendez Silva', 'mmendez@usfq.edu.ec'),
(161, 'Monica Catalina Perez Vega', 'mcperez@usfq.edu.ec'),
(162, 'Nathan Todd Digby', 'ndigby@usfq.edu.ec'),
(163, 'Nelson Fernando Garcia Garcia', 'ngarciag@usfq.edu.ec'),
(164, 'Nelson Jose Maldonado Samaniego', 'nmaldonados@usfq.edu.ec'),
(165, 'Nelson Miranda', 'nmirandam@usfq.edu.ec'),
(166, 'Nicolas Castrillon Sarria', 'ncastrillon@usfq.edu.ec'),
(167, 'Noel Perez Perez', 'nperez@usfq.edu.ec'),
(168, 'Oliver James Carrick', 'ocarrick@usfq.edu.ec'),
(169, 'Omar Alejandro Aguirre Serrano', 'oaguirre@usfq.edu.ec'),
(170, 'Oscar Camacho', 'ocamacho@usfq.edu.ec'),
(171, 'Oswaldo Santos Davalos', 'osantos@usfq.edu.ec'),
(172, 'Pablo de la Cerda Perez', 'pdelacerda@usfq.edu.ec'),
(173, 'Pablo Francisco Endara Davila', 'pendara@usfq.edu.ec'),
(174, 'Pablo Hernan Davalos Muirragui', 'pdavalos@usfq.edu.ec'),
(175, 'Pablo Sebastian Burneo Arteaga', 'psburneo@usfq.edu.ec'),
(176, 'Paola Torres', 'ptorres@usfq.edu.ec'),
(177, 'Paolo Moncagatta', 'pmoncagatta@usfq.edu.ec'),
(178, 'Patricio Chiriboga', 'pchiriboga@usfq.edu.ec'),
(179, 'Patricio Rojas Silva', 'projas1@usfq.edu.ec'),
(180, 'Paul Cardenas', 'pacardenas@usfq.edu.ec'),
(181, 'Paul Rosero Contreras', 'proseroc@usfq.edu.ec'),
(182, 'Pedro Javier Moncayo Herrera', 'pmoncayo@usfq.edu.ec'),
(183, 'Pedro Jose Ducos Ruiz', 'pjducos@usfq.edu.ec'),
(184, 'Pedro Manuel Aponte', 'pmaponte@usfq.edu.ec'),
(185, 'Pedro Roberto Nunes da Silva', 'pnunes@usfq.edu.ec'),
(186, 'Pieter Van ''t Hof', 'pvanthof@usfq.edu.ec'),
(187, 'Rafael Soria', 'rsoriap@usfq.edu.ec'),
(188, 'Rafael Villota-Jetzer', 'rvillota@usfq.edu.ec'),
(189, 'Rene Patricio Jativa Espinoza', 'rjativa@usfq.edu.ec'),
(190, 'Rene Rolando Parra Narvaez', 'rrparra@usfq.edu.ec'),
(191, 'Rhys James Davies', 'rdavies@usfq.edu.ec'),
(192, 'Ricardo Andres Lopez Celi', 'ralopez@usfq.edu.ec'),
(193, 'Richard Dale West', 'rwest@usfq.edu.ec'),
(194, 'Roberto Burneo Calisto', 'rburneo@usfq.edu.ec'),
(195, 'Rodrigo Andres Munoz-Valencia', 'ramunoz@usfq.edu.ec'),
(196, 'Rodrigo Xavier Jaramillo Almeida', 'xjaramillo@usfq.edu.ec'),
(197, 'Salvatore Foti', 'sfoti@usfq.edu.ec'),
(198, 'Santiago Esteban Ruales  Bastidas', 'srualesb@usfq.edu.ec'),
(199, 'Santiago Javier Paladines Guerrero', 'spaladinesg@usfq.edu.ec'),
(200, 'Santiago Raul Castellanos Vallejo', 'scastellanos@usfq.edu.ec'),
(201, 'Sebastian Navas', 'snavasb@usfq.edu.ec'),
(202, 'Sebastian Ponce', 'sponce@usfq.edu.ec'),
(203, 'Simeon Floyd', 'sfloyd1@usfq.edu.ec'),
(204, 'Thomas Cadenbach', 'tcadenbach@usfq.edu.ec'),
(205, 'Tiago Bittencourt', 'tbittencourt@usfq.edu.ec'),
(206, 'Victor Herrera', 'vherrera@usfq.edu.ec'),
(207, 'Victor Raul Viteri Breedy', 'vviteri@usfq.edu.ec'),
(208, 'Victoria Alomia', 'valomia@usfq.edu.ec'),
(209, 'Vladimir Rodriguez Yarmushevskaya', 'vrodriguez@usfq.edu.ec'),
(210, 'Wilson Orellana', 'worellanam@usfq.edu.ec'),
(211, 'Xavier Andrade Castillo', 'xandrade@usfq.edu.ec'),
(212, 'Yovani Marrero-Ponce', 'ymarrero@usfq.edu.ec');

-- Insertar datos en la tabla Modalidad
INSERT INTO Modalidad (Modalidad_id, Nombre) VALUES
(1, 'Presencial'),
(2, 'Virtual Sincrónico'),
(3, 'Híbrido'),
(4, 'En Línea');

-- Insertar datos en la tabla Horario
INSERT INTO Horario (Horario_id, Hora) VALUES
(1, '07:00 - 08:20'),
(2, '08:30 - 09:50'),
(3, '10:00 - 11:20'),
(4, '11:30 - 12:50'),
(5, '13:00 - 14:20'),
(6, '14:30 -15:50'),
(7, '16:00 - 17:20'),
(8, '17:30 - 18:50'),
(9, '19:00 - 20:20'),
(10, '20:30 - 21:50');

INSERT INTO Subespecializacion (SubEsp_id, Colegio_id, Nombre) VALUES
(0, 7, "Danza - Artes Escenicas"),
(1, 7, "Fotografia"),
(2, 7, "Ilustracion y Arte Secuencial"),
(3, 7, "Teatro - Artes Escenicas"),
(4, 7, "Animacion Digital"),
(5, 7, "Arte Textil"),
(6, 7, "Arte y Tecnologia"),
(7, 7, "Artes Graficas"),
(8, 7, "Artes Visuales"),
(9, 7, "Cine"),
(10, 7, "Comunicacion Organizacional"),
(11, 7, "Desarrollo Web y Apps"),
(12, 7, "Diseno Comunicacional"),
(13, 7, "Diseno de Modas"),
(14, 7, "Periodismo"),
(15, 7, "Periodismo Deportivo"),
(16, 7, "Publicidad"),
(17, 7, "Videojuegos"),
(18, 1, "Analisis de Datos"),
(19, 1, "Emprendimiento"),
(20, 1, "Marketing Digital Global"),
(21, 6, "Antropologia"),
(22, 6, "Ciencia Politica"),
(23, 6, "Educacion"),
(24, 6, "Educacion Inclusiva"),
(25, 6, "Escritura Creativa"),
(26, 6, "Estudios de Genero"),
(27, 6, "Estudios Europeos"),
(28, 6, "Estudios Latinoamericanos"),
(29, 6, "Filosofia"),
(30, 6, "Historia"),
(31, 6, "Historia del Arte"),
(32, 6, "Ingles"),
(33, 6, "Lengua, Cultura y Comunicacion"),
(34, 6, "Literatura"),
(35, 6, "Psicologia"),
(36, 6, "Relaciones Internacionales"),
(37, 6, "Sociologia"),
(38, 11, "Arreglos y Composicion"),
(39, 11, "Ejecucion Instrumental o Vocal"),
(40, 11, "Industria Musical"),
(41, 11, "Musica Contemporanea"),
(42, 11, "Produccion de Audio"),
(43, 11, "Produccion Musical"),
(44, 3, "Biologia"),
(45, 3, "Biotecnologia"),
(46, 3, "Gestion Ambiental"),
(47, 3, "Microbiologia"),
(48, 10, "Conducta Criminal"),
(49, 10, "Derecho Ambiental, Sostenibilidad y Recursos Naturales"),
(50, 10, "Derecho Empresarial"),
(51, 10, "Derecho Penal"),
(52, 10, "Derechos Humanos"),
(53, 10, "Manejo de Conflictos, Negociacion, Mediacion y Arbitraje"),
(54, 8, "Economia"),
(55, 5, "Fisica"),
(56, 5, "Ingenieria Ambiental"),
(57, 5, "Ingenieria Electronica"),
(58, 5, "Ingenieria en Agronomia"),
(59, 5, "Ingenieria en Alimentos"),
(60, 5, "Ingenieria en Ciencias de la Computacion"),
(61, 5, "Ingenieria Industrial"),
(62, 5, "Ingenieria Mecanica"),
(63, 5, "Ingenieria Quimica"),
(64, 5, "Matematicas"),
(65, 5, "Quimica"),
(66, 6, "Gestion del Talento"),
(67, 9, "Gestion Deportiva y de Entretenimiento"),
(68, 9, "Hospitalidad y Hoteleria"),
(69, 9, "Turismo Sustentable"),
(70, 4, "Nutricion"),
(71, 9, "Organizacion de Eventos"),
(72, 2, "Subespecializacion en Diseno Ambiental"),
(73, 2, "Subespecializacion en Vivienda");

