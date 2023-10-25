-- docenti(id pk,cognome,nome)
-- materie(id pk,descrizione)
-- classi(id pk, anno, sezione)
-- studenti(id pk, classe_id fk, cognome, nome)
-- classi_docenti_materie(classe_id fk, docente_id fk, materia_id fk)

create database if not exists f5_registro_elettronico;
create table if not exists f5_registro_elettronico.docenti(
 id int not null auto_increment primary key, cognome varchar(50), nome varchar(50)
);
create table if not exists f5_registro_elettronico.materie(
 id int not null auto_increment primary key, descrizione varchar(100)
);
create table if not exists f5_registro_elettronico.classi(
id int not null auto_increment primary key, anno varchar(1), sezione varchar(1)
);
create table if not exists f5_registro_elettronico.studenti(
id int not null auto_increment primary key, classe_id int, cognome varchar(50), nome varchar(50)
);
create table if not exists f5_registro_elettronico.classi_docenti_materie(
classe_id int, docente_id int, materia_id int
);

-- vincolo di INTEGRITA' REFERENZIALE
-- un riferimento non può essere eliminato a meno che non esistono vincoli
alter table f5_registro_elettronico.studenti 
ADD FOREIGN KEY (classe_id) REFERENCES classi(id); 

alter table f5_registro_elettronico.classi_docenti_materie
ADD FOREIGN KEY (classe_id) REFERENCES classi(id),
ADD FOREIGN KEY (docente_id) REFERENCES docenti(id),
ADD FOREIGN KEY (materia_id) REFERENCES materie(id);
     

INSERT INTO f5_registro_elettronico.classi (anno,sezione) VALUES
	 ('1','A'),
	 ('1','B'),
	 ('1','C'),
	 ('1','D'),
	 ('1','E'),
	 ('1','F'),
	 ('1','G'),
	 ('1','H'),
	 ('2','A'),
	 ('2','B');
INSERT INTO f5_registro_elettronico.classi (anno,sezione) VALUES
	 ('2','C'),
	 ('2','D'),
	 ('2','E'),
	 ('2','F'),
	 ('2','G'),
	 ('2','H'),
	 ('3','A'),
	 ('3','B'),
	 ('3','C'),
	 ('3','D');
INSERT INTO f5_registro_elettronico.classi (anno,sezione) VALUES
	 ('3','E'),
	 ('3','F'),
	 ('3','G'),
	 ('3','H'),
	 ('4','A'),
	 ('4','B'),
	 ('4','C'),
	 ('4','D'),
	 ('4','E'),
	 ('4','F');
INSERT INTO f5_registro_elettronico.classi (anno,sezione) VALUES
	 ('4','G'),
	 ('4','H'),
	 ('5','A'),
	 ('5','B'),
	 ('5','C'),
	 ('5','D'),
	 ('5','E'),
	 ('5','F'),
	 ('5','G'),
	 ('5','H');

	
	INSERT INTO f5_registro_elettronico.docenti (cognome,nome) VALUES
	 ('Acquamarina','Antonella'),
	 ('Amaranto','Antonia'),
	 ('Ambra','Antonietta'),
	 ('Ametista','Arianna'),
	 ('Arancione','Arisa'),
	 ('Ardesia','Armanda'),
	 ('Argento','Asia'),
	 ('Asparago','Augusta'),
	 ('Avorio','Agostino'),
	 ('Azzurro','Mauro');
INSERT INTO f5_registro_elettronico.docenti (cognome,nome) VALUES
	 ('Beige','Aurelia'),
	 ('Bianco','Aurora'),
	 ('Biscotto','Azzurra'),
	 ('Bistro','Ada'),
	 ('Blu','Adalisa'),
	 ('Bordeaux','Adriana'),
	 ('Bronzo','Afra'),
	 ('Camoscio','Agata'),
	 ('Carbone','Agrippa'),
	 ('Carminio','Agrippina');
INSERT INTO f5_registro_elettronico.docenti (cognome,nome) VALUES
	 ('Castagno','Alba'),
	 ('Catrame','Dalila'),
	 ('Celadon','Damiana'),
	 ('Celeste','Daniela'),
	 ('Ceruleo','Desdemona'),
	 ('Chartreuse','Diana'),
	 ('Ciano','Diletta'),
	 ('Ciliegia','Fabia'),
	 ('Cioccolato','Fabiola'),
	 ('Cobalto','Faustina');
INSERT INTO f5_registro_elettronico.docenti (cognome,nome) VALUES
	 ('Conchiglia','Federica'),
	 ('Corallo','Fernanda'),
	 ('Crema','Nuccia'),
	 ('Cremisi','Nunzia'),
	 ('Denim','Elvio'),
	 ('Eliotropo','Emanuele'),
	 ('Ecru','Emidio'),
	 ('Fiore di granturco','Emiliano'),
	 ('Foglia di tè','Emilio'),
	 ('Fucsia','Enea');
INSERT INTO f5_registro_elettronico.docenti (cognome,nome) VALUES
	 ('Fucsia Bordesto Lillato','Ennio'),
	 ('Fulvo','Enrico'),
	 ('Gainsboro','Enzo'),
	 ('Giada','Erberto'),
	 ('Giallo','Ermanno'),
	 ('Granata','Ermenegildo'),
	 ('Grigio','Ernesto'),
	 ('Incarnato prugna','Ersilio'),
	 ('Indaco','Espedito'),
	 ('International Klein Blue','Ettore');
INSERT INTO f5_registro_elettronico.docenti (cognome,nome) VALUES
	 ('Kaki','Eustachio'),
	 ('Lampone','Eustasio'),
	 ('Lavanda','Evaristo'),
	 ('Limone','Evasio'),
	 ('Limone crema','Ezio'),
	 ('Lime','Mattia'),
	 ('Lino','Mauro'),
	 ('Magenta','Maurizio'),
	 ('Magnolia','Medoro'),
	 ('Malva','Michelangelo');
INSERT INTO f5_registro_elettronico.docenti (cognome,nome) VALUES
	 ('Mandarino','Michele'),
	 ('Marrone','Milo'),
	 ('Melanzana','Miro'),
	 ('Mogano','Modesto'),
	 ('Ocra','Monio'),
	 ('Orchidea','Morfeo'),
	 ('Oliva chiaro','Sabatino'),
	 ('Oro','Sabino'),
	 ('Ottone antico','Salvatore'),
	 ('Papaia','Salva');
INSERT INTO f5_registro_elettronico.docenti (cognome,nome) VALUES
	 ('Pervinca','Sofiano'),
	 ('Pesca','Sandro'),
	 ('Platino','Sansone'),
	 ('Porpora','Santino'),
	 ('Prugna','Eustachio'),
	 ('Rame','Eustasio'),
	 ('Rosa','Adriana'),
	 ('Rosso','Afra'),
	 ('Rubino','Agata'),
	 ('Sabbia','Ezio');
INSERT INTO f5_registro_elettronico.docenti (cognome,nome) VALUES
	 ('Salmone','Mattia'),
	 ('Scarlatto','Mauro'),
	 ('Seppia','Maurizio'),
	 ('Turchese','Aurelia'),
	 ('Verde','Aurora'),
	 ('Verde Veronese','Azzurra'),
	 ('Vermiglio','Ada'),
	 ('Viola','Adalisa'),
	 ('Zafferano','Mauro');

	
	INSERT INTO f5_registro_elettronico.materie (descrizione) VALUES
	 ('PROVA FINALE'),
	 ('BIOLOGIA GENERALE'),
	 ('GENETICA UMANA'),
	 ('ANATOMIA UMANA'),
	 ('BIOCHIMICA'),
	 ('FISIOLOGIA UMANA'),
	 ('METODOLOGIA MEDICO SCIENTIFICA'),
	 ('ISTOLOGIA E EMBRIOLOGIA'),
	 ('MICROBIOLOGIA'),
	 ('NEUROSCIENZE');
INSERT INTO f5_registro_elettronico.materie (descrizione) VALUES
	 ('MALATTIE INFETTIVE'),
	 ('GINECOLOGIA E OSTETRICIA'),
	 ('MEDICINA DELLO SPORT'),
	 ('MALATTIE DELL’APPARATO LOCOMOTORE'),
	 ('IMMUNOLOGIA'),
	 ('FARMACOLOGIA 1'),
	 ('FARMACOLOGIA 2'),
	 ('ANATOMIA PATOLOGICA'),
	 ('PSICHIATRIA'),
	 ('PEDIATRIA');
INSERT INTO f5_registro_elettronico.materie (descrizione) VALUES
	 ('SEMEIOTICA MEDICA E CHIRURGICA'),
	 ('MEDICINA DI LABORATORIO'),
	 ('MALATTIE DEL SISTEMA IMMUNITARIO E REUMATOLOGIA'),
	 ('MALATTIE SANGUE'),
	 ('MALATTIE CARDIOVASCOLARI'),
	 ('MALATTIE APPARATO RESPIRATORIO'),
	 ('MALATTIE DEL RENE E APPARATO URINARIO'),
	 ('MALATTIE SISTEMA ENDOCRINO E METABOLISMO'),
	 ('MALATTIE APPARATO DIGERENTE'),
	 ('MALATTIE CUTANEE E CHIRURGIA PLASTICA');
INSERT INTO f5_registro_elettronico.materie (descrizione) VALUES
	 ('MALATTIE ORGANI DI SENSO'),
	 ('SCIENZE NEUROLOGICHE'),
	 ('INGLESE 2'),
	 ('CLINICA MEDICA 1'),
	 ('CLINICA MEDICA 2'),
	 ('PATOLOGIA GENERALE'),
	 ('ADE VI ANNO'),
	 ('MEDICINA PREVENTIVA'),
	 ('MEDICINA PUBBLICA'),
	 ('CHIRURGIA ED EMERGENZE');
INSERT INTO f5_registro_elettronico.materie (descrizione) VALUES
	 ('DIAGNOSTICA PER IMMAGINI E ONCOLOGIA'),
	 ('FISICA MEDICA'),
	 ('INGLESE 1'),
	 ('TIROCINIO SEMEIOTICA MEDICA'),
	 ('TIROCINIO SEMEIOTICA CHIRURGICA'),
	 ('TIROCINIO IV ANNO'),
	 ('TIROCINI V ANNO'),
	 ('TIROCINI A SCELTA VI ANNO'),
	 ('TIROCINI OBBLIGATORI VI ANNO'),
	 ('APPROFONDIMENTI DI FISIOLOGIA UMANA');
INSERT INTO f5_registro_elettronico.materie (descrizione) VALUES
	 ('TECNICHE DIAGNOSTICHE E TERAPEUTICHE: ECG, IMAGING TOMOGRAFICO, ADROTERAPIA'),
	 ('INSUFFICIENZA RENALE ACUTA E CRONICA: CASI CLINICI IN NEFROLOGIA'),
	 ('ORGANIZZAZIONE E MANAGMENT SANITARIO'),
	 ('IL TRAPIANTO CARDIACO'),
	 ('APPROFONDIMENTI IN ECG'),
	 ('MECCANISMI DI ANTIBIOTICO RESISTENZA: DIAGNOSTICA E IMPATTO CLINICO'),
	 ('ANATOMIA TOPOGRAFICA PROPEDEUTICA ALLA CHIRURGIA'),
	 ('FORMARE CON L’ECOGRAFIA ALLE SCIENZE DI BASE'),
	 ('PRASSI DELLA COMUNICAZIONE MEDICA'),
	 ('ANATOMIA MACROSCOPICA DIGITALIZZATA');
INSERT INTO f5_registro_elettronico.materie (descrizione) VALUES
	 ('ATTUALITA’ IN CHIRUGIA GENERALE'),
	 ('APPROFONDIMENTO IN CHRURGIA: CHIRURGIA ROBOTICA E SPECIALISTICA'),
	 ('GLOBAL HEALTH'),
	 ('IL PAZIENTE CON DISABILITA’'),
	 ('AGGIORNAMENTI IN CARDIOLOGIA'),
	 ('AGGIORNAMENTI IN NEFROLOGIA'),
	 ('LA RICERCA BIBLIOGRAFICA IN AMBIENTE MEDICO'),
	 ('LA SEMEIOTICA CARDIOVASCOLARE TONI E SOFFI CARDIACI'),
	 ('LABORATORIO DI ATTIVITA’ PRATICHE DI BASE CLINICAL SKILLS PER L’APPROCCIO INTEGRATO AL PAZIENTE'),
	 ('ABILITA’ NEL COMUNICARE LE CATTIVE NOTIZIE NEL MONDO SANITARIO');
INSERT INTO f5_registro_elettronico.materie (descrizione) VALUES
	 ('MEDICINA MOLECOLARE'),
	 ('MEDICINA PREVENTIVA');

	
	INSERT INTO f5_registro_elettronico.classi_docenti_materie (classe_id,docente_id,materia_id) VALUES
	 (11,53,50),
	 (11,69,54),
	 (11,72,49),
	 (12,2,8),
	 (12,79,34),
	 (13,47,25),
	 (14,11,21),
	 (14,29,40),
	 (14,34,62),
	 (15,53,67);
INSERT INTO f5_registro_elettronico.classi_docenti_materie (classe_id,docente_id,materia_id) VALUES
	 (15,83,65),
	 (15,85,20),
	 (16,11,12),
	 (16,70,2),
	 (17,67,22),
	 (18,57,34),
	 (18,89,63),
	 (19,67,66),
	 (1,21,30),
	 (1,6,55);
INSERT INTO f5_registro_elettronico.classi_docenti_materie (classe_id,docente_id,materia_id) VALUES
	 (1,77,39),
	 (20,17,69),
	 (20,57,63),
	 (20,74,36),
	 (21,72,30),
	 (21,80,14),
	 (22,73,23),
	 (22,88,35),
	 (23,16,17),
	 (24,73,49);
INSERT INTO f5_registro_elettronico.classi_docenti_materie (classe_id,docente_id,materia_id) VALUES
	 (24,78,50),
	 (25,10,68),
	 (25,48,27),
	 (25,77,40),
	 (26,32,26),
	 (26,59,57),
	 (27,36,26),
	 (27,51,2),
	 (27,68,15),
	 (28,51,68);
INSERT INTO f5_registro_elettronico.classi_docenti_materie (classe_id,docente_id,materia_id) VALUES
	 (28,61,21),
	 (28,85,48),
	 (29,44,33),
	 (29,60,67),
	 (31,44,36),
	 (31,50,42),
	 (32,1,13),
	 (32,29,8),
	 (33,41,11),
	 (33,57,60);
INSERT INTO f5_registro_elettronico.classi_docenti_materie (classe_id,docente_id,materia_id) VALUES
	 (34,22,6),
	 (34,42,7),
	 (34,65,67),
	 (35,31,42),
	 (35,61,3),
	 (35,76,17),
	 (36,18,55),
	 (37,12,52),
	 (38,39,21),
	 (3,24,35);
INSERT INTO f5_registro_elettronico.classi_docenti_materie (classe_id,docente_id,materia_id) VALUES
	 (3,2,13),
	 (3,32,15),
	 (3,75,47),
	 (40,71,8),
	 (40,82,30),
	 (5,57,47),
	 (5,78,14),
	 (6,33,59),
	 (7,17,43),
	 (7,54,22);
INSERT INTO f5_registro_elettronico.classi_docenti_materie (classe_id,docente_id,materia_id) VALUES
	 (7,63,6),
	 (8,27,62),
	 (8,44,47),
	 (9,34,26),
	 (9,54,19),
	 (9,84,11);

	
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (37,'ABOUNNASR','ILIASS'),
	 (21,'ABOUNNASR','YASSIR'),
	 (6,'ADOCHIEI','LEONARDO'),
	 (21,'AFONNE','CHIBUIKEM VICTOR'),
	 (20,'AGBOGA','CHRISTIAN'),
	 (15,'AGGIO','ANDREA'),
	 (6,'AGGIO','DAVIDE'),
	 (18,'AGOSTINI','LORENZO'),
	 (15,'AGOSTINI','MARCELLO'),
	 (39,'AGOSTINI','MATTIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (25,'AGOURAR','YASSINE'),
	 (17,'AIGHIMIEN','MIRACLE'),
	 (32,'AIT OTMANE','AYMAN'),
	 (5,'ALBERGHINI','MATILDE'),
	 (31,'ALBERTIN','EDOARDO'),
	 (34,'ALBERTIN','FILIPPO'),
	 (16,'ALBERTIN','LORENZO'),
	 (29,'ALBERTIN','RICCARDO'),
	 (37,'ALBIERI','MATTIA'),
	 (23,'ALTIERI','ELIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (26,'ALTIERI','LORENZO'),
	 (1,'AMBROSI','MATTIA'),
	 (22,'AMBROSIO','GIOELE'),
	 (34,'ANDOLFO','FABIO'),
	 (27,'ANDOLFO','MATTEO'),
	 (1,'ANDREELLO','ANGELO'),
	 (24,'ANDREELLO','MATTIA'),
	 (19,'ANDREOLI','DIEGO'),
	 (36,'ANDREOLI','PIETRO'),
	 (4,'ANDREOLI','STEFANO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (19,'ANDREOSE','LUCA'),
	 (27,'ANDREOTTI','SABRINA'),
	 (13,'ANDRIOLI','WILLIAM'),
	 (29,'ANDRIOTTO','FEDERICO'),
	 (19,'ANESCU','LUIS ARMANDO'),
	 (1,'ANGAD','MOHAMED'),
	 (13,'ANGELERI','SIRIA'),
	 (27,'ANGERI','ALAN'),
	 (35,'ANI','CHIJIOKE PRINCE'),
	 (19,'ANTINARELLA','MATTIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (6,'ARCIDIACONO','CHIARA'),
	 (4,'ARETUSINI','FILIPPO'),
	 (4,'ARFIERO','ELISABETTA'),
	 (40,'ARGENTON','ALESSIO'),
	 (8,'AROUSSY','ISMAIL'),
	 (20,'ASTOLFI','ANNAPAOLA'),
	 (4,'AVANZI','THOMAS'),
	 (19,'AVDULAJ','AURORA'),
	 (10,'AZERRAF','SALAH ADDIN'),
	 (36,'BACCAGLINI','ALESSIO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (15,'BACCAGLINI','ANGELA SOFIA'),
	 (30,'BACCAGLINI','GIORGIA'),
	 (19,'BACCAGLINI','LEONARDO'),
	 (37,'BACCAGLINI','NICCOLO'''),
	 (4,'BACCARO','AGNESE'),
	 (17,'BACCARO','MATTIA'),
	 (11,'BACCHIEGA','ALESSANDRO'),
	 (28,'BACCHIEGA','ARAMIS ALEXANDER'),
	 (9,'BACCHIEGA','RICCARDO'),
	 (15,'BAGATIN','FRANCESCO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (29,'BAGNANI','GIOVANNI'),
	 (25,'BAI','LUISA'),
	 (3,'BAIOCATO','AURORA'),
	 (8,'BAKKARI','MOHAMED'),
	 (20,'BALA','REI'),
	 (19,'BALDIN','FEDERICO'),
	 (28,'BALDIN','FRANCESCO'),
	 (7,'BALDIN','GAIA'),
	 (20,'BALDIN','GIACOMO'),
	 (15,'BALDISSEROTTO','TOMMASO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (17,'BALDO','ELIA'),
	 (7,'BALDO','GIOELE'),
	 (25,'BALDON','GIANLUCA'),
	 (12,'BALLABEN','FRANCESCO'),
	 (26,'BALLARIN','GABRIELE'),
	 (17,'BALLESTRIERO','LUCA'),
	 (32,'BALLIU','ENDRJUS'),
	 (25,'BALZANI','DARIO'),
	 (32,'BANAJ','MELISSA'),
	 (23,'BARACCO','MARCO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (35,'BARALDO','NICOLO'''),
	 (33,'BARATTO','FRANCESCO'),
	 (40,'BARBETTA','THOMAS'),
	 (23,'BARBIERI','ALICE'),
	 (23,'BARBIN','ANDREA'),
	 (3,'BARBINI','GIACOMO'),
	 (28,'BARCHERI','MICHELE'),
	 (12,'BARCHERI','RONNY'),
	 (39,'BARCHI','FILIPPO'),
	 (2,'BARCHI','TOMMASO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (17,'BARDELLA','DAVIDE'),
	 (22,'BARI','TOMMASO'),
	 (38,'BARIANI','PAOLO'),
	 (11,'BARIN','GIACOMO'),
	 (9,'BARISON','DAVIDE'),
	 (25,'BARISON','GIULIA'),
	 (32,'BARONCELLI','LUCA'),
	 (25,'BARONCINI','ANDREA'),
	 (19,'BARONI','BRYAN'),
	 (30,'BARONI','FEDERICO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (38,'BARONI','MATTEO'),
	 (5,'BARUCHELLO','GIULIO'),
	 (30,'BASAGLIA','ELIA'),
	 (23,'BASAGLIA','ISAAC'),
	 (4,'BASAGLIA','NOEMI'),
	 (18,'BASRA','HARVIR PAL SINGH'),
	 (5,'BASSANI','MARIA'),
	 (32,'BASSINI','RICCARDO'),
	 (13,'BASSORA','CHRISTIAN'),
	 (32,'BATTISTINI','CRISTIANO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (25,'BATTIZOCCO','MARCO'),
	 (27,'BAUCE','MATTIA'),
	 (14,'BAUDO','VERONICA'),
	 (9,'BAZAJ','FRANCESCO'),
	 (32,'BAZZAN','GIACOMO'),
	 (6,'BAZZAN','ROCCO'),
	 (36,'BAZZAN','THOMAS'),
	 (15,'BECCARI','MATTEO'),
	 (10,'BECCATI','FILIPPO'),
	 (19,'BECCHIATI','JOSHUA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (29,'BEDENDO','GABRIELE'),
	 (24,'BEDENDO','LEONARDO'),
	 (10,'BEDENDO','MATTEO'),
	 (11,'BEDENDO','NICOLO'''),
	 (37,'BEDENDO','PIETRO'),
	 (13,'BEDENDO','RICCARDO'),
	 (2,'BEGO','FRANCESCO'),
	 (16,'BELCARO','LETIZIA'),
	 (34,'BELLAN','GIULIA'),
	 (36,'BELLAN','RAFFAELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (20,'BELLESIA','FILIPPO'),
	 (3,'BELLESIA','TOMMASO'),
	 (40,'BELLETTI','LEONARDO'),
	 (13,'BELLINELLO','GIULIO'),
	 (13,'BELLINELLO','MATTIA'),
	 (7,'BELLINELLO','MATTIA'),
	 (16,'BELLINETTO','ENRICO'),
	 (19,'BELLOTTO','EMMA'),
	 (39,'BELLUCCO','VANESSA'),
	 (12,'BELLUCO','ALBERTO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'BELLUCO','GIACOMO'),
	 (24,'BELTRAME','ALBERTO'),
	 (36,'BENA''','GIULIA'),
	 (9,'BENA''','LORENZO'),
	 (17,'BENETAZZO','ALESSIA'),
	 (7,'BENETTI','MICHELE'),
	 (39,'BENZINA','CHAIR'),
	 (21,'BERGAMASCHI','RICCARDO'),
	 (23,'BERGAMO','DARIO'),
	 (9,'BERGAMO','DARIO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (36,'BERGAMO','DARIO'),
	 (8,'BERGANTIN','ELIA'),
	 (15,'BERGO','DANIEL'),
	 (23,'BERGO','ILARY'),
	 (3,'BERGO','MARIKA'),
	 (38,'BERGO','NOEMI'),
	 (14,'BERGO','SOFIA'),
	 (12,'BERNARDINELLO','CHRISTOPHER'),
	 (15,'BERNARDINELLO','GIOVANNI'),
	 (26,'BERNARDINELLO','NICOLA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'BERNARDINELLO','TOMMASO'),
	 (6,'BERNELLO','TOMMASO'),
	 (35,'BERSAN','FILIPPO'),
	 (2,'BERTACIN','DAVIDE'),
	 (32,'BERTAGLIA','MARCO'),
	 (3,'BERTAGLIA','NICOLA'),
	 (22,'BERTAZZO','ELENA'),
	 (4,'BERTAZZO','FRANCESCO'),
	 (17,'BERTAZZO','RICCARDO'),
	 (37,'BERTI','MATTIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (17,'BERTIN','ANDREA'),
	 (18,'BERTO','ANDREA'),
	 (17,'BERTO','GIOVANNI'),
	 (11,'BERTO','MATTHIAS'),
	 (29,'BERTOLIN','ALESSANDRO'),
	 (7,'BERTONCELLO','NICOLO'''),
	 (2,'BERTONI','ANDREA'),
	 (35,'BETTARELLO','ALBERTO'),
	 (9,'BETTARELLO','BENEDETTA'),
	 (7,'BETTARELLO','ENRICO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (35,'BETTARELLO','LUCA'),
	 (5,'BETTARELLO','PIETRO'),
	 (6,'BETTERO','MARIASOLE'),
	 (39,'BEVILACQUA','TOMMASO'),
	 (35,'BHARTI','HITESH'),
	 (2,'BIANCHI','MARCO'),
	 (17,'BIANCHINI','FILIPPO'),
	 (34,'BIANCHINI','FRANCESCO'),
	 (32,'BIANCHINI','TOMMASO'),
	 (36,'BIANCONI','MARTA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (25,'BIASI','MARTINA'),
	 (2,'BIASIN','FILIPPO'),
	 (20,'BIASIOLO','FRANCESCO'),
	 (30,'BIDO','VALENTINA'),
	 (36,'BIGHETTI','MATTEO'),
	 (8,'BIHARS','RIHARDS'),
	 (30,'BIROLO','NICO'),
	 (9,'BISCUOLA','AXEL'),
	 (12,'BISCUOLA','MATTIA'),
	 (11,'BISCUOLO','LORENZO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (6,'BISESTI','GABRIELE'),
	 (28,'BIZZARO','ENRICO'),
	 (3,'BIZZI','TOMMASO'),
	 (24,'BLASI','EMILIANO'),
	 (9,'BOAROLO','RAFFAELE'),
	 (2,'BOCANCIA','DENIS ANDREI'),
	 (13,'BOCCARDO','DARIO'),
	 (21,'BOCCATO','MATTEO'),
	 (1,'BOCCHI','VALERIA'),
	 (35,'BOCHIS','ELENA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (35,'BOLANDAU','ION'),
	 (37,'BOLDRIN','ETTORE'),
	 (11,'BOLOGNESE','GABRIELE'),
	 (18,'BOLOGNESE','MASSIMO'),
	 (3,'BOLOGNESE','MATTEO'),
	 (9,'BOLOGNESI','GIANLUCA'),
	 (38,'BOLOGNESI','NATHAN'),
	 (14,'BOLOGNINI','GIULIO'),
	 (4,'BOLZANI','FEDERICO'),
	 (13,'BOLZONARO','ANDREA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (34,'BOLZONARO','ILARJ'),
	 (5,'BOMBACIGNO','RICCARDO'),
	 (33,'BONDESAN','FRANCESCO'),
	 (5,'BONDESAN','IRENE'),
	 (3,'BONIOLO','MATTEO'),
	 (20,'BONOMO','LUCA'),
	 (35,'BONOMO','STEFANO'),
	 (13,'BONVENTO','IRENE'),
	 (14,'BONVENTO','LANFRANCO'),
	 (34,'BORDIN','DAVIDE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (35,'BORDON','ANDREA'),
	 (12,'BORDON','BENEDETTA'),
	 (30,'BOREGGIO','GIADA'),
	 (11,'BOREGGIO','MATTIA'),
	 (22,'BORELLA','CRISTIAN'),
	 (27,'BORGATO','ANDREA'),
	 (13,'BORGATO','DIEGO'),
	 (37,'BORGATO','FILIPPO'),
	 (33,'BORGATO','SARA'),
	 (10,'BORGHESAN','DANIEL');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (4,'BORGHETTO','AURORA FILOMENA'),
	 (16,'BORGHI','DAVIDE'),
	 (23,'BORGHI','ELISA'),
	 (36,'BORILE','SARA'),
	 (39,'BORSETTO','RACHELE'),
	 (15,'BORTOLOTTI','NICOLA'),
	 (26,'BOSCARATO','CHRISTIAN'),
	 (31,'BOSCARATO','NICOLO'''),
	 (33,'BOSCARO','RICCARDO'),
	 (32,'BOSCO','IRENE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (22,'BOSCOLO','STEFANO'),
	 (7,'BOSSONE','JACOPO'),
	 (6,'BOTEZATU','MICHELA'),
	 (19,'BOUANANE','WASSIM'),
	 (34,'BOUGROUCH','YASSINE'),
	 (35,'BOVO','DAVIDE'),
	 (5,'BOVOLENTA','SARA'),
	 (19,'BOZZA','THOMAS'),
	 (17,'BOZZO','ALESSANDRO'),
	 (1,'BRAGGION','TOMMASO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (5,'BRAGION','SIMONE'),
	 (35,'BRAGIOTO','NICO'),
	 (39,'BRANCALEON','PAOLO'),
	 (4,'BRANCALION','EDOARDO'),
	 (40,'BRANCO','SIMONE'),
	 (33,'BRANDALESE','GIUSEPPE'),
	 (21,'BRASILIANI','ALESSANDRO'),
	 (11,'BRASILIANI','RICCARDO'),
	 (38,'BRAZZOROTTO','CRISTIAN'),
	 (25,'BRESSAN','LUNA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (2,'BRESSAN','RICCARDO'),
	 (23,'BREVILIERO','PIETRO'),
	 (5,'BRIGHENTI','SOFIA'),
	 (40,'BRIGO','ENRICO'),
	 (40,'BRIGO','NOEMI'),
	 (39,'BROCADELLO','FRANCESCO'),
	 (17,'BRONDIN','GIAMPIETRO'),
	 (13,'BRONZOLO','DAVIDE'),
	 (26,'BRUNELLO','GIOVANNI'),
	 (9,'BRUNELLO','LUCA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (14,'BRUNO','COSTANTINO'),
	 (25,'BUBOLA','LORENZO'),
	 (22,'BUFFA','ALESSANDRO'),
	 (13,'BULDRINI','IACOPO'),
	 (39,'BULGARI','LEONARDO'),
	 (27,'BUOSO','CHIARA'),
	 (2,'BUOSO','MATTIA'),
	 (22,'BUOSO','PAOLO'),
	 (40,'BUSIN','GIOVANNI'),
	 (14,'BUSON','KENZO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (34,'BUTTINI','LUCA'),
	 (32,'BUZZONI','CESARE'),
	 (36,'CABIGLIERA','GIOVANNI'),
	 (2,'CACCIOLA','TOMMASO'),
	 (6,'CAFISO','ANDREA'),
	 (3,'CALEFFI','JACOPO'),
	 (2,'CALESELLA','MATILDE'),
	 (37,'CALLEGARI','FILIPPO'),
	 (3,'CALLEGARI','FRANCESCO'),
	 (33,'CALLEGARO','MARIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (33,'CALLEGARO','MATTIA'),
	 (33,'CALZAVARINI','ALBERTO'),
	 (29,'CALZAVARINI','CRISTIAN'),
	 (10,'CAMPION','MARCO'),
	 (24,'CANAZZA','AURORA'),
	 (15,'CANAZZA','LUCA'),
	 (1,'CANAZZA','SAMUEL'),
	 (9,'CANIATO','MANUEL'),
	 (11,'CANIATO','NICOLAS'),
	 (15,'CANIATO','SAMUEL');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (23,'CANTI','ENRICO'),
	 (26,'CAOBIANCO','LUCA'),
	 (7,'CAPETTA','ANDREA'),
	 (7,'CAPITOZZO','ALBERTO'),
	 (1,'CAPOCCHIANO','EMANUELE'),
	 (26,'CAPODAGLIO','GIOSUE'''),
	 (37,'CAPPATO','SARA'),
	 (18,'CAPPELLATO','MATTEO'),
	 (36,'CAPPELLO','SERGIO'),
	 (26,'CAPUZZO','DIEGO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (3,'CAPUZZO','GABRIELE'),
	 (38,'CAPUZZO','GIACOMO'),
	 (36,'CAPUZZO','GIULIA'),
	 (3,'CARAGHERGHI','ALESSANDRO'),
	 (18,'CARAGHERGHI','MASSIMO'),
	 (40,'CARBONIN','LORENZO NUBE'),
	 (15,'CARDONE','DIEGO VITTORIO'),
	 (21,'CARLETTI','GIULIA'),
	 (12,'CARLINI','ELISA'),
	 (10,'CARRARO','MICHELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (3,'CARRARO','ZENO'),
	 (9,'CARRAVIERI','CHIARA'),
	 (24,'CARRAVIERI','GIANLUCA'),
	 (22,'CARUSO','CAROLA'),
	 (37,'CASARO','LORENZO'),
	 (13,'CASARO','RICCARDO'),
	 (14,'CASAROLLI','MATTIA'),
	 (22,'CASOTTO','JACOPO'),
	 (39,'CASTELLANI','ANNA'),
	 (35,'CATTOZZO','EMMA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (22,'CAVALIERE','MARTIN'),
	 (2,'CAVALIERE','PIER LEONARDO'),
	 (30,'CAVALIERE','RICCARDO'),
	 (28,'CAVALLARI','ANNA'),
	 (17,'CAVALLARO','ANDREA'),
	 (11,'CAVALLARO','FILIPPO'),
	 (11,'CAVALLINI','MARISOL ROSALINDA'),
	 (5,'CAVICCHIOLI','LUCA'),
	 (32,'CAVRIANI','MARCO'),
	 (26,'CAZZADORE','MATTIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'CECCHETTO','GIANLUCA'),
	 (9,'CECCHETTO','KAROL'),
	 (5,'CECCHETTO','MANUEL'),
	 (33,'CECCHINELLO','GIANLUCA'),
	 (26,'CECCOLIN','LORENZO'),
	 (34,'CECCONELLO','MATTEO MASSIMILIANO'),
	 (6,'CECERE','ESTER'),
	 (28,'CECILIATO','ELISA'),
	 (32,'CELIO','MARCO'),
	 (7,'CERVATI','MICHELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (22,'CESARO','ALESSANDRO'),
	 (30,'CESTARO','MARCO'),
	 (40,'CHAKIR','TAYBI'),
	 (17,'CHECCHINATO','EMMA'),
	 (14,'CHERAR','ABEL'),
	 (1,'CHERGUI','MOHAMED'),
	 (26,'CHERUBIN','NICCOLO'''),
	 (2,'CHIARION','DANIELE'),
	 (24,'CHIARION','RITA'),
	 (8,'CHIEREGATO','ALEX');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (8,'CHIERICATI','PIETRO'),
	 (11,'CHINEDOZI','VALENTINO CHIDERAA EMANUELE'),
	 (39,'CHINEDU','DAVID CHUKWUNONYELUM'),
	 (16,'CHIOLDIN','FLAVIO'),
	 (1,'CHIOZZI','GIOVANNI'),
	 (29,'CHOUHAN','ADITYA'),
	 (20,'CHOUJA','YASSINE'),
	 (39,'CHRISTOU','NIKOLAOS'),
	 (8,'CIBIN','MATTEO'),
	 (12,'CIBOTTO','EMANUELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (37,'CIGARINI','MARTINA'),
	 (21,'CINTI','ALBERTO'),
	 (6,'CIOSICI','DARIO ALEXANDRU'),
	 (19,'CIPRIANI','TOMMASO'),
	 (2,'CIRELLI','GRETA'),
	 (18,'CIRINO','DAVIDE'),
	 (28,'CLAUDINI','DANIELE'),
	 (9,'CLEMENTE','SOFIA'),
	 (39,'COBIANCHI','LUCA'),
	 (1,'COL','MATTEO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (1,'COLA','PIETRO'),
	 (6,'COLLA','EDOARDO GIUSEPPE'),
	 (19,'COLLA','GIORGIA'),
	 (33,'COLOGNESE','FILIPPO'),
	 (36,'COLOGNESI','DIEGO'),
	 (26,'COLOMBANI','LORENZO'),
	 (19,'COLOMBARINI','IRIS'),
	 (20,'COLOMBO','MANUEL'),
	 (33,'COLOMBO','MIRKO'),
	 (39,'COLTRO','ALESSANDRO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (5,'COLTRO','DILAN'),
	 (12,'COLTRO','MATTIA'),
	 (38,'COMINATO','FABIO'),
	 (13,'COMINATO','MATTEO'),
	 (27,'CONCEICAO','RICCARDO'),
	 (9,'CONFORTO','ANNA'),
	 (12,'CONFORTO','LEONARDO'),
	 (9,'CONSOLATI','ALESSANDRO'),
	 (40,'CONTATO','MATTIA'),
	 (20,'CONTATO','MATTIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (2,'CONTIERO','DAVIDE'),
	 (33,'CONTIERO','PIETRO'),
	 (20,'CONTIN','MATTEO'),
	 (16,'CORSINI','TOMMASO'),
	 (8,'COSMI','ELEONORA'),
	 (19,'COSTA','ANNA'),
	 (28,'COSTA','CHIARA'),
	 (11,'COSTA','DAMIANO'),
	 (26,'COSTA','MICHELE'),
	 (17,'COSTA','MICKY');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (36,'COSTANZO','PIETRO'),
	 (34,'COVONE','DEVID GIUSEPPE'),
	 (11,'CREPALDI','LIA'),
	 (35,'CREPALDI','LORENZO'),
	 (11,'CREPALDI','MATTIA'),
	 (1,'CREPALDI','RICCARDO'),
	 (28,'CREPALDI','THOMAS'),
	 (18,'CRETU','GABRIELE'),
	 (28,'CRIVELLARO','MARCO'),
	 (22,'CROZZOLETTO','LARA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (18,'CUCCATO','JACOPO'),
	 (19,'CUCU','FABIO MIHAI'),
	 (32,'CULATI','MATTIA'),
	 (1,'CULATTI','THOMAS'),
	 (14,'CUPINI','EDOARDO'),
	 (37,'CUSIN','RICCARDO'),
	 (1,'D''ACCOLTI','MARIKA'),
	 (27,'DA RE','EDOARDO'),
	 (22,'DAL CHECCO','TOMMASO'),
	 (31,'DAL MARTELLO','VITTORIO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (6,'DALL''AGLIO','DIEGO'),
	 (16,'DALL''ARA','LUCA'),
	 (12,'DALL''ARMELLINA','LUCA'),
	 (14,'DALL''OCCO','ALESSANDRO'),
	 (17,'DALL''OCCO','ANDREA'),
	 (20,'DALL''OCCO','EMANUELE'),
	 (19,'DALL''OCCO','FRANCESCO GIOVANNI'),
	 (9,'DALL''OCCO','NICOLA'),
	 (37,'DARDANI','ISABELLA'),
	 (16,'DAVI''','ALESSIO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (30,'DAVI''','ANTONIO'),
	 (2,'DAVI''','CRISTIAN'),
	 (12,'DAVI''','PIETRO'),
	 (1,'DAVI''','RICCARDO'),
	 (6,'DAVI''','TOMMASO'),
	 (25,'DAVID','ANTONIO'),
	 (22,'DAVIN','ANTONIO'),
	 (29,'DAZIALE','DENNIS BENITO'),
	 (27,'DE BATTISTI','MATTEO'),
	 (17,'DE BEI','NICOLA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (20,'DE FAVERI','RICCARDO'),
	 (22,'DE GRANDI','LISA'),
	 (36,'DE LUCA','ALESSANDRO'),
	 (12,'DE LUCIA','VINCENZO'),
	 (13,'DE MARIANIS','MATTIA'),
	 (32,'DE MARTINO','PAOLO'),
	 (31,'DE STEFANI','EDOARDO'),
	 (37,'DE TOMI','ESTER'),
	 (34,'DELIA','MATTIA'),
	 (35,'DELLA PIETRA','DANIELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (6,'DELLA PIETRA','LORENZO'),
	 (31,'DELON','GIOVANNI'),
	 (13,'DEMARTINI','SIMONE'),
	 (38,'DERKACH','IHOR'),
	 (30,'DESIRO''','EMILIANO'),
	 (31,'DESIRO''','FRANCESCO'),
	 (4,'DESTRO','MAICOL'),
	 (39,'DI CAPRIO','GIOVANNI'),
	 (2,'DI DIO','THOMAS'),
	 (3,'DI FAZIO','GIOVANNI');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (39,'DI GAETANO','FRANCESCO'),
	 (9,'DIAN','JACOPO'),
	 (37,'DING','ALESSANDRO'),
	 (18,'DISSETTE','ANDREA'),
	 (31,'DIZDARI','DARIO'),
	 (32,'DOLCETTO','SAMUELE'),
	 (13,'DOLLANI','KEVIN'),
	 (4,'DOMCHUK','IEVGEN'),
	 (25,'DONA''','SIMONE'),
	 (13,'DONDOLIN','MANUEL');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'DONDOLIN','MATTIA'),
	 (31,'DONEGA''','EMMA'),
	 (25,'DONEGA''','FILIPPO'),
	 (11,'DRAGO','GIOVANNI'),
	 (31,'DRESSADORE','EDOARDO'),
	 (26,'ECHCHARI','ISMAIL'),
	 (8,'EDDOUIOU','ABDELFETTAH'),
	 (29,'EDEH','CHUKWUKANYIMA EMMANUEL'),
	 (18,'EKHATOR','DERRICK OSAYEMWENRE'),
	 (4,'EL ALEM','BILAL');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (31,'EL ASRI','SAAD'),
	 (7,'EL FORCEAU','MOHAMED'),
	 (7,'EL HAMDI','RIDA'),
	 (32,'EL HAMDI','SAAD'),
	 (33,'EL KHADIMI','ADAM'),
	 (36,'EL MAGHRAOUI','EL MEHDI'),
	 (33,'EL MAGHRAOUI','MOHAMED AMINE'),
	 (18,'EL MEKH','ZAKARIA'),
	 (32,'EL OUARRARI','ILYASS'),
	 (11,'EMMANUEL','CLINTON SOPROCHUKWU');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (8,'ERBACCI','PIETRO'),
	 (1,'ERRABAHY','MOHAMED'),
	 (6,'ESALTI','ALBERTO'),
	 (18,'ESOFAGO','FILIPPO'),
	 (34,'ESPOSITO','BRYAN'),
	 (17,'ESPOSITO','GIUSEPPE'),
	 (5,'ESPOSITO','LORENZO'),
	 (23,'EZ ZAYTOUNI','AMINA'),
	 (32,'EZ ZAYTOUNI','KHALID'),
	 (7,'EZENNADI','BRYAN NDUBISI');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (33,'FABBIAN','RICCARDO'),
	 (17,'FABBIO','GIACOMO'),
	 (30,'FABBRIS','GRETA'),
	 (22,'FABBRO','MATTIA'),
	 (37,'FACCINI','FRANCESCO'),
	 (2,'FACCIOLI','DIEGO'),
	 (24,'FACCIOLI','MARIELE'),
	 (8,'FACCON','RICCARDO'),
	 (39,'FACENTE','FRANCESCO'),
	 (8,'FALLETTI','CHIARA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (6,'FANTATO','ALICE'),
	 (22,'FANTI','EDOARDO'),
	 (37,'FANTIN','DAVIDE'),
	 (10,'FANTINATI','EMILY'),
	 (13,'FASOLO','RACHELE'),
	 (5,'FAVARO','DAVIDE'),
	 (37,'FAVARO','MATTIA'),
	 (16,'FAVATO','MATTEO'),
	 (16,'FECCHIO','ALICE'),
	 (2,'FERARIU','ANDREI');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (1,'FERRACIN','MIRCO'),
	 (33,'FERRARESE','GIANMARCO'),
	 (35,'FERRARESE','MICHELE'),
	 (30,'FERRARI','ALEX'),
	 (26,'FERRARI','DAVIDE'),
	 (14,'FERRARI','DENNY'),
	 (19,'FERRARI','FRANCESCA'),
	 (10,'FERRARI','MARCO'),
	 (29,'FERRAROLLO','CRISTIAN'),
	 (29,'FERRATI','ANNA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (5,'FERRATI','MATTIA'),
	 (3,'FERRIANI','ALESSIA'),
	 (8,'FERRIGATO','FRANCESCO'),
	 (20,'FERRO','PIETRO'),
	 (10,'FILIPPI','ANNA'),
	 (25,'FILOCAMO','PIETRO'),
	 (19,'FINCATO','FILIPPO'),
	 (32,'FINESSI','DAVID'),
	 (8,'FIOCCHI','FILIPPO'),
	 (21,'FIOCCO','SARA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (29,'FIORE','FRANCESCO'),
	 (28,'FIORE','MARGHERITA'),
	 (16,'FOGAGNOLO','MORGAN'),
	 (8,'FONTANESI','ALICE'),
	 (29,'FONTOLAN','ENRICO'),
	 (28,'FONTOLAN','NICOLO'''),
	 (27,'FORLANI','SEBASTIANO'),
	 (13,'FORMAGGIO','ANDREA'),
	 (10,'FORMAGGIO','ANGELO'),
	 (6,'FORMAGGIO','EMMA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (20,'FORMAGGIO','MATTEO'),
	 (9,'FORMAGGIO ZILIO','ZOE'),
	 (10,'FORNASARO','LORENZO'),
	 (29,'FORNASIERO','MATTEO'),
	 (20,'FORNO','ELIA'),
	 (20,'FRACASSO','LUCA'),
	 (25,'FRACCON','MASSIMO'),
	 (11,'FRACCON','STEFANO'),
	 (27,'FRANCATO','MATTIA'),
	 (30,'FRANCESCHETTI','TOMMASO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (37,'FRANCESCHINI','ALEX ETTORE'),
	 (31,'FRANCESI','MATTEO'),
	 (2,'FRANCO','MAYRA'),
	 (32,'FRANZOLIN','ALESSIA'),
	 (21,'FRANZOLIN','MATTEO'),
	 (23,'FRANZOSO','MATTIA'),
	 (16,'FRASSON','DANIEL'),
	 (21,'FRIGATO','FABIO'),
	 (35,'FRISO','MATILDE'),
	 (23,'FURIN','FABIO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (36,'FURINI','JACOPO'),
	 (37,'FURLAN','GAIA'),
	 (34,'FUSETTI','LUCA'),
	 (5,'FUSO','MATTEO'),
	 (28,'GABAN','NICOLA'),
	 (29,'GABANELLA','LEONARDO'),
	 (6,'GABRIELI','ANGELA'),
	 (32,'GABRIELLI','FRANCESCO'),
	 (4,'GAGGIOFATTO','FRANCESCO'),
	 (15,'GAGLIARDO','ELEONORA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (8,'GAGLIARDO','ERIK'),
	 (34,'GAINO','MICHELE'),
	 (20,'GALETTO','LORENZO'),
	 (36,'GALLANA','NICHOLAS'),
	 (35,'GALLI','GIORGIA'),
	 (37,'GALVAN','GABRIELE'),
	 (2,'GAMBARO','FILIPPO'),
	 (20,'GAMBATO','GIULIO'),
	 (26,'GARAVELLO','FRANCESCO'),
	 (14,'GARBI','ELISA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (11,'GARBIN','JACOPO'),
	 (36,'GARBIN','NICOLAS'),
	 (35,'GARZIERA','FEDERICO'),
	 (32,'GASPARETTO','CRISTIAN'),
	 (16,'GASPARETTO','GIOVANNI MARIA'),
	 (23,'GASPARETTO','MATTIA'),
	 (15,'GASTALDELLO','TOMMASO'),
	 (17,'GAVRYLOVETS','SOFIIA'),
	 (23,'GAZZI','PIETRO'),
	 (37,'GAZZUOLA','NICOLA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (36,'GENESINI','MATTEO'),
	 (13,'GHINATO','NICOLO'''),
	 (15,'GHIRARDELLO','ALESSIO'),
	 (5,'GHIRARDELLO','GIORGIA'),
	 (37,'GHIRARDELLO','GIOVANNI'),
	 (35,'GHIRARDI','ANDREA'),
	 (7,'GHIRELLO','EMMA'),
	 (21,'GHIRELLO','FABIO'),
	 (1,'GHIROTTO','CHIARA'),
	 (24,'GHIROTTO','GIOVANNI');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (26,'GIALDISI','ALESSANDRO'),
	 (32,'GIAMBRI','MARCO'),
	 (34,'GIANDOSO','MARCO'),
	 (35,'GIANESELLA','RICCARDO'),
	 (21,'GIANNETTO','GABRIELE ANTONIO'),
	 (22,'GIATTI','FILIPPO'),
	 (17,'GIATTI','GABRIELE'),
	 (22,'GIOACHIN','ANGELICA'),
	 (13,'GIOLO','FILIPPO'),
	 (15,'GIOLO','LORENZO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (10,'GIOLO','MATTIA'),
	 (20,'GIORDANI','ALESSANDRO'),
	 (4,'GIORDANI','ANTONIO'),
	 (17,'GIORDANI','ELIA'),
	 (22,'GIROTTI','STEFANO'),
	 (3,'GIULIOTTI','ANDREA'),
	 (4,'GIUNI','UMBERTO'),
	 (34,'GIURIATI','ELENA'),
	 (22,'GIURIATO','MATTEO'),
	 (34,'GIURIOLO','DANIL');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (32,'GIURIOLO','KIRILL'),
	 (33,'GOLAI','GABRIEL CATALIN'),
	 (7,'GOLAI','PETRU IUSTIN'),
	 (30,'GOREAN','ADRIAN'),
	 (18,'GOTTI','FRANCESCO'),
	 (26,'GRANDI','SIMONE'),
	 (6,'GRANFO','MARTINO'),
	 (28,'GRANO','RICCARDO'),
	 (12,'GRAPPEGGIA','NICCOLO'''),
	 (5,'GREGGIO','GABRIELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (32,'GREGGIO','STEFANO'),
	 (3,'GREGO','EMMA'),
	 (10,'GRIGOLATO','ALESSIA'),
	 (9,'GRIGOLATO','DAVIDE SABINO'),
	 (1,'GRIGOLATO','ELIA'),
	 (11,'GROSSI','TOMMASO'),
	 (1,'GROTTO','GIULIA'),
	 (40,'GUCCIARDI','ISABELLE'),
	 (1,'GUERRA','LEONARDO'),
	 (20,'GUEZAM','MOHAMED');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (18,'GUGLIELMO','FELIPE'),
	 (3,'GUGLIELMO','PAOLO'),
	 (31,'GULMINI','MAICOL'),
	 (30,'GUOLO','CATERINA'),
	 (22,'GUOLO','MATTEO'),
	 (30,'GUZZON','LORENZO'),
	 (1,'GUZZON','MATTEO'),
	 (39,'HANNIOUI','ABDELJALIL'),
	 (24,'HARIT','OMAR'),
	 (15,'HASSEN','KHALED');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (35,'HLAOUI','YOUSSOUF'),
	 (4,'HORVATH','ARON'),
	 (39,'HRAF','SOFIIA'),
	 (28,'HRIRDEN','HASSANE'),
	 (19,'HRIRDEN','LAHOUCINE'),
	 (26,'HRYTSYNA','DMYTRO'),
	 (10,'HU','HAI TAO'),
	 (3,'HU','LUCA'),
	 (24,'HU','TIAN HAO'),
	 (20,'HU','YONG LE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (40,'HU','YONGKANG'),
	 (28,'HUA','DAVIDE'),
	 (13,'HUTI','SAMUELE'),
	 (31,'IACOBELLIS','TOMMASO'),
	 (30,'IBEH','TESTMONY CHIAGOZIEM'),
	 (1,'INCAO','SARA'),
	 (17,'IOVU','CRISTIAN'),
	 (34,'ISAKU','GESON'),
	 (29,'IYOHA','EBENEZER TOMMASO'),
	 (5,'JALLOUL','AMIN');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (2,'JANKOVIC','ALEKSANDAR'),
	 (10,'KADRIU','FABRICIO'),
	 (29,'KARCHA','DENIS'),
	 (30,'KEBE','SERIGNE SALIOU'),
	 (22,'KIS BAJRAJ','ARION'),
	 (25,'KIS BAJRAJ','LEON'),
	 (8,'KONDAKCIU','STEFANO'),
	 (10,'KORZH','ARTUR'),
	 (37,'KOSTYAKOV','ANDREY'),
	 (6,'KRUG MANSOUR','TARIK');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (17,'KUMAR SHARMA','HARDIK'),
	 (18,'KUMARA PATABANDIGE','RASINDU ARUNODH SILVA'),
	 (39,'LAGHI','ALBERTO'),
	 (37,'LAGHI','DAVIDE'),
	 (15,'LAGO','MARCO'),
	 (7,'LAGO','RICCARDO'),
	 (35,'LAHBIB','MEHDI'),
	 (10,'LAMKALAK','AMINE'),
	 (28,'LAMOUADANE','MOHMD'),
	 (31,'LAURENTE','SEBASTIAN');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'LAURENTI','FILIPPO'),
	 (16,'LAURIA','GABRIEL'),
	 (1,'LAZZARI','MATTIA'),
	 (37,'LAZZARIN','CAROLINA'),
	 (39,'LAZZARIN','CRISTINA'),
	 (23,'LAZZARIN','PIETRO MINH'),
	 (3,'LENGU','TREVIS'),
	 (18,'LEONARDI','FABIO'),
	 (17,'LIBANORE','GIOELE'),
	 (27,'LIDEO','ANGELO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (28,'LIDEO','ENRICO'),
	 (2,'LILA','ELADIO'),
	 (8,'LIN','LUCIANO'),
	 (1,'LIN','XIN YI'),
	 (23,'LIONELLO','EDOARDO'),
	 (10,'LOATO','LORENZO'),
	 (11,'LONGO','THOMAS'),
	 (39,'LOUDIYI','MOHAMMED AMINE'),
	 (33,'LOUEZNA','HAJAR'),
	 (28,'LUCCHETTA','MARCO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (14,'LUCCHIARI','LORENZO'),
	 (36,'LUCCHINI','NICOLA'),
	 (3,'LUSIANI','NICOLO'''),
	 (27,'MABEA','MARCO'),
	 (23,'MACI','PIETRO'),
	 (15,'MAESTRI','LISA'),
	 (19,'MAFFEI','PIETRO'),
	 (23,'MAGHENZANI','NICOLO'''),
	 (16,'MAGNARELLO','ALEX'),
	 (1,'MAGNARELLO','MARIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (5,'MAGNO','VIOLA'),
	 (36,'MAGOSSO','ANDREA'),
	 (19,'MAGOSSO','NICOLO'''),
	 (8,'MAGRIN','DANIELE'),
	 (18,'MAGRIN','ENRICO'),
	 (2,'MALACESCU','ISABELLA NICHOLETA'),
	 (9,'MALACHIN','LORENZO'),
	 (26,'MALAMAN','ALESSANDRA'),
	 (31,'MALAMAN','NICOLO'''),
	 (26,'MALAMAN','RICCARDO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (28,'MALANCHIN','ALESSANDRO'),
	 (30,'MALANCHIN','ALEX'),
	 (30,'MALIN','RICCARDO'),
	 (27,'MANCIN','MARIA'),
	 (25,'MANCINI','GIANLUCA'),
	 (2,'MANCINI','NICOLA'),
	 (37,'MANFRIN','ALBERTO'),
	 (20,'MANFRIN','LUCA'),
	 (19,'MANFRINATI','RAYZA'),
	 (37,'MANIEZZI','CAMILLA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (20,'MANTOAN','MICHAEL'),
	 (35,'MANTOVANI','CARLO'),
	 (28,'MANTOVANI','DAVIDE'),
	 (34,'MANTOVANI','MATTEO'),
	 (2,'MANZOLI','GIORDANO'),
	 (30,'MARABESE','FABIO'),
	 (33,'MARABESI','GUIDO'),
	 (15,'MARABINI','TOMMASO'),
	 (33,'MARAGNA','ANGELICA'),
	 (3,'MARAGNO','FRANCESCO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (37,'MARAGNO','PIETRO'),
	 (25,'MARANGON','ELENA'),
	 (5,'MARANGONI','LORIS'),
	 (16,'MARANGONI','NICOLO'''),
	 (1,'MARAVINCI','IVAN'),
	 (37,'MARCELLO','BEATRICE'),
	 (20,'MARCELLO','PIETRO'),
	 (8,'MARCHESANI','GIANMARCO'),
	 (3,'MARCHETTI','EDOARDO'),
	 (31,'MARCHETTI','FEDERICO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (26,'MARCHETTI','FILIPPO'),
	 (12,'MARCHETTI','NICHOLAS'),
	 (13,'MARCHETTO','FRANCESCO'),
	 (36,'MARCHI','VIOLA'),
	 (3,'MARCHIORO','STEFANO'),
	 (2,'MARELLA','ENRICO'),
	 (14,'MARINI','LUCA'),
	 (7,'MAROCCO','MATTIA'),
	 (27,'MARTINELLI','ALBERTO'),
	 (15,'MARTINELLI','DENIS');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (23,'MARTINELLI','MATTEO ANTONIO'),
	 (6,'MARTINELLI','SAMUELE'),
	 (5,'MARTINELLI','TOMMASO'),
	 (26,'MARTINELLO','NICOLE'),
	 (4,'MARTINI','PIETRO'),
	 (35,'MARUZZO','FILIPPO GIUSEPPE'),
	 (9,'MARZANA','ALESSIO'),
	 (21,'MARZOLA','MATTEO'),
	 (3,'MARZOLLA','MANUEL'),
	 (40,'MARZOLLA','PIETRO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (19,'MARZOLLA','RICCARDO'),
	 (40,'MASIERO','ALEX'),
	 (5,'MASIERO','FILIPPO'),
	 (3,'MASIERO','MICHAEL'),
	 (35,'MASIERO','SIMONE'),
	 (23,'MASON','GIACOMO'),
	 (33,'MASSARENTE','TOMMASO'),
	 (30,'MASSARO','GIORGIO'),
	 (25,'MATTIOLI','DAVIDE'),
	 (39,'MATTIOLO','RICCARDO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (4,'MAZZIERO','DANIELE'),
	 (36,'MAZZOLAIO','RICCARDO'),
	 (34,'MAZZULLO','LORENZO'),
	 (14,'MELEGA','RICCARDO'),
	 (4,'MELLONI','FILIPPO ANTONIO'),
	 (2,'MENARELLO','TOMMASO'),
	 (5,'MENARELLO','TOMMASO'),
	 (21,'MENIN','CLAUDIO'),
	 (2,'MERLARATI','ALESSANDRO'),
	 (28,'MERLO','RICCARDO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (20,'MERLO','SOFIA'),
	 (30,'MHANNI','ADAM'),
	 (34,'MICHELOTTO','GIORGIA'),
	 (14,'MICHELOTTO','MATTEO'),
	 (3,'MIGHRI','HAMZA'),
	 (4,'MIGLIORINI','ANDREA'),
	 (35,'MIGLIORINI','ETHAN'),
	 (7,'MIGLIORINI','GIACOMO'),
	 (21,'MIHALCEAN','VLADA'),
	 (18,'MILAN','ALESSIO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (29,'MILAN','ANTONIO JAMES'),
	 (22,'MILAN','GABRIELE'),
	 (13,'MILAN','GIOELE'),
	 (8,'MILAN','LORENZO'),
	 (36,'MILAN','MARTINA'),
	 (11,'MILANI','ANDREA'),
	 (13,'MILANI','EMMA'),
	 (27,'MILANI','GRETA'),
	 (4,'MILANI','LINDA'),
	 (4,'MILEA','SEBASTIAN PETRISOR');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (35,'MIMINLLARI','MATTEO'),
	 (12,'MINGARDO','ENRICO'),
	 (21,'MINGIONE','LUIGI'),
	 (36,'MINGOZZI','NICOLA'),
	 (39,'MIRACCA','TERESA'),
	 (37,'MIREA','RARES ANDREI'),
	 (3,'MISCHIATTI','PIETRO'),
	 (22,'MIZZON','ALESSANDRO'),
	 (29,'MODA','IVAN'),
	 (29,'MODA','RICCARDO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (1,'MODA','SAMUELE'),
	 (22,'MODENA','ALESSIA'),
	 (37,'MOISE','ROLAND-ADRIAN'),
	 (30,'MOLLA','ANDREA'),
	 (37,'MONTACCIANI','ANNA'),
	 (1,'MONTACCIANI','LUCA'),
	 (6,'MONTECCHIO','GIOSUE'''),
	 (39,'MOOTHO CURPEN','TOMMASO'),
	 (10,'MORELLO','MIRIAM'),
	 (30,'MORETTO','MADDALENA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (25,'MORI','FEDERICO'),
	 (6,'MORI','SIMONE'),
	 (16,'MOTTA','ANNA'),
	 (17,'MOTTIN','RICCARDO'),
	 (39,'MUDU','SIMONE'),
	 (36,'MUNARI','MATTEO MICHELE'),
	 (39,'MUNERATO','ACHILLE'),
	 (27,'MUNERATO','ALESSANDRO'),
	 (3,'MUNERATO','NICOLA'),
	 (33,'MUSTAFAJ','DESSANT');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (8,'MUTU','STEFAN'),
	 (2,'NAFTULOVYCH','KOSTIANTYN'),
	 (14,'NAFTULOVYCH','OLEKSII'),
	 (18,'NAGY','STEFAN VICTOR'),
	 (27,'NALE','ALESSIO'),
	 (22,'NALIN','AURORA'),
	 (25,'NARDI CAGNOTTO','LORENZO'),
	 (21,'NAVA','BEATRICE'),
	 (15,'NAVARRI','ASIA'),
	 (37,'NEGRELLO','DAVID');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (19,'NEGRELLO','MARCO'),
	 (39,'NEGRI','MATTIA'),
	 (12,'NESE','GIACOMO'),
	 (20,'NEZAJ','CRISTIAN'),
	 (22,'NICOLI','ALESSIA'),
	 (11,'NICOLI','CHIARA'),
	 (10,'NICOLI','FRANCESCO'),
	 (18,'NICOLIN','EMILY'),
	 (31,'NICOLIN','THOMAS'),
	 (16,'NOVACOV','VICTOR');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (19,'NOVO','GIANLUCA'),
	 (1,'NUSHI','MATEO'),
	 (8,'OKAFOR','ALEX CHIEMERIE'),
	 (8,'OKEKE','KENNETT CHIDIEBERE'),
	 (17,'OLIVA','FABIO'),
	 (21,'OLIVIERI','DAVIDE'),
	 (27,'OMOIGUIE','OSAYIMWEN GOD''S WILL'),
	 (28,'ONGARO','NICOLO'''),
	 (24,'ORIZU','PRINCE CHIDOZIE'),
	 (11,'ORLANDO','ALESSANDRO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'OSADOLOR','RITA ISIBOR'),
	 (9,'OSAWE','ENOSAKHALE WISDOM'),
	 (37,'OSIASHVILI','ANTONI'),
	 (36,'OSTI','GIOIA'),
	 (6,'OSTI','LEONARDO'),
	 (15,'OTTINO','ANISIA'),
	 (20,'OUHAMOU','WALID'),
	 (35,'PACURAR','PATRICK'),
	 (4,'PADOAN','VLADIS'),
	 (27,'PADOVANI','MATILDE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'PADRIN','MICHELE'),
	 (35,'PAIOLA','GABRIELE'),
	 (15,'PALANCA','LORENZO'),
	 (38,'PALATTELLA','CRISTIAN'),
	 (10,'PALAZZI','MORGAN'),
	 (33,'PALETTA','FRANCESCO'),
	 (24,'PALMIERI','PIETRO'),
	 (37,'PALTANIN','GIULIA'),
	 (2,'PALTANIN','NICCOLO'''),
	 (36,'PALUELLO','ANDREA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (17,'PALUELLO','TOMMASO'),
	 (34,'PANIAMOGAN','ZANDER BROOKS'),
	 (2,'PANIN','FILIPPO'),
	 (31,'PANIN','SATYA'),
	 (8,'PANTANO','MATTIA'),
	 (17,'PAPA','REDION'),
	 (22,'PARMEGIAN','DANIEL'),
	 (31,'PASELLO','ANDREA'),
	 (25,'PASETTO','CLAUDIA'),
	 (34,'PASHAJ','ALESSIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (33,'PASOTTO','RICCARDO'),
	 (35,'PASQUALI','LORENZO'),
	 (9,'PASQUALIN','ENRICO'),
	 (21,'PASQUALINI','NICOLA'),
	 (39,'PASQUALINI','NICOLA'),
	 (1,'PASQUALON','CARLOTTA'),
	 (13,'PASQUIN','RICCARDO'),
	 (14,'PASQUIN','SOFIA'),
	 (26,'PASSADORE','ROCCO'),
	 (27,'PASSARELLA','SAMUELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (15,'PASSARELLA','TARIQUA'),
	 (18,'PASTELLI','CARLOTTA'),
	 (7,'PASTORE','FRANCESCO'),
	 (10,'PASTORELLO','FILIPPO'),
	 (28,'PATRACCHINI','ANDREA'),
	 (24,'PATRACCHINI','DAVIDE MARIO'),
	 (5,'PATRIAN','DANIELE'),
	 (5,'PAVAN','ALBERTO'),
	 (31,'PAVAN','MATTEO'),
	 (35,'PAVAN','SAMUELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (19,'PAVAN','STEFANO'),
	 (9,'PAVANELLO','IRENE'),
	 (12,'PAVANELLO','LORIS'),
	 (11,'PAVANELLO','LUDOVICA'),
	 (9,'PAVANELLO','MATTIA'),
	 (9,'PAVANIN','GABRIELE'),
	 (17,'PAVARIN','LEONARDO'),
	 (39,'PAVARIN','MATTIA'),
	 (28,'PEAGNO','RICCARDO'),
	 (38,'PECI','MARIAVITTORIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (19,'PEDRINI','IRENE'),
	 (30,'PEGORARO','MARTINA'),
	 (27,'PEGORARO','MATTIA'),
	 (16,'PEGORARO','RICCARDO'),
	 (40,'PELA''','MATTEO'),
	 (23,'PELLEGRINI','ANDREA'),
	 (29,'PELLEGRINI','DENNY'),
	 (6,'PELLEGRINI','IVAN'),
	 (10,'PELLEGRINI','JACOPO'),
	 (26,'PELLEGRINI','MATTIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (20,'PELLEGRINI','MATTIA'),
	 (12,'PELLEGRINI','ROCCO'),
	 (12,'PELLEGRINO','ALBERTO'),
	 (26,'PENOLAZZI','FRANCESCO'),
	 (38,'PERAINO','GIACOMO'),
	 (30,'PERATELLO','CRISTIAN'),
	 (4,'PERETTO','LEONARDO'),
	 (7,'PERICOLI','LORENZO'),
	 (5,'PERIN','ELISA'),
	 (18,'PERINI','GIACOMO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (8,'PERNECHELE','GIACOMO'),
	 (10,'PERSONA','ALEX'),
	 (32,'PESCE','SIMONE'),
	 (21,'PEZZAN','NICHOLAS'),
	 (15,'PEZZOLATO','FRANCESCA'),
	 (25,'PEZZUOLO','EDOARDO LUCIANO'),
	 (33,'PIANA','DIEGO'),
	 (23,'PIANA','LUCA'),
	 (17,'PIERANTONI','ALBERTO'),
	 (10,'PIETROBON','JACOPO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (12,'PIETROPOLI','EMMA'),
	 (30,'PIETROPOLI','LEO'),
	 (40,'PIGA','NICOLA'),
	 (26,'PIGAIANI','ALESSANDRO'),
	 (33,'PIGAIANI','GIACOMO'),
	 (33,'PIGATO','ANGELICA'),
	 (33,'PILOTTO','EMMA'),
	 (7,'PILOTTO','MANUEL'),
	 (5,'PIOMBO','ENZO'),
	 (21,'PIOMBO NICOLI','FILIPPO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'PIRANI','ANNA'),
	 (34,'PIRAS','SIMONE'),
	 (20,'PIROLO','MATTIA'),
	 (23,'PISCOPO','GIORGIA'),
	 (6,'PISTIS','MIRKO'),
	 (35,'PIVA','ALBERTO'),
	 (35,'PIVA','MARCO'),
	 (15,'PIVA','RACHELE'),
	 (2,'PIZZARDO','SAMUELE'),
	 (31,'PIZZO','PIETRO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (23,'PIZZO','SIMONE'),
	 (23,'PIZZOLATO','ALESSIO'),
	 (30,'POGGIONI','NICOLO'''),
	 (30,'POLETTI','SILVIA'),
	 (12,'POLI','ALESSIO'),
	 (6,'POLI','LUCA'),
	 (17,'POLI','MATTEO'),
	 (24,'PONCINA','ASIA'),
	 (8,'PONZETTO','ALBERTO'),
	 (18,'POPESCU','DANIELA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (22,'PORTESAN','DIEGO'),
	 (19,'POZZATO','AURORA'),
	 (29,'POZZATO','CARLO'),
	 (1,'POZZATO','KARIM'),
	 (9,'POZZATO','PIETRO'),
	 (32,'PRANDO','GIOVANNI'),
	 (15,'PRANDO','VITTORIO'),
	 (37,'PRAVATO','CHIARA'),
	 (30,'PREARO','ENRICO'),
	 (20,'PREGNOLATO','VITTORIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (3,'PRESCIANOTTO','FABIO'),
	 (26,'PRETI','LORENZO'),
	 (5,'PREVEATO','ANDREA'),
	 (37,'PREVIATO','ALEX'),
	 (40,'PREVIATO','CAMILLA'),
	 (9,'PREVIATO','NICOLAS'),
	 (9,'PREVIATO','RICCARDO'),
	 (2,'PRONTERA','DAVIDE'),
	 (5,'PROVENZALE','ANTHONY'),
	 (22,'PRUDENZIATO','DAVIDE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (17,'PUGGINA','NICO'),
	 (33,'PUNCHINA','WILLIAM'),
	 (16,'PUTINATO','MATTEO'),
	 (26,'QIU','XIAQIANG'),
	 (25,'QUAGLIO','RICCARDO'),
	 (9,'QUINTO','ERIK'),
	 (33,'RAIMONDI','ALESSANDRO'),
	 (39,'RAIMONDI','MATILDE'),
	 (25,'RAISA','NICOLA'),
	 (16,'RAITO','EMMA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (22,'RAMAZZINA','ILARIA'),
	 (40,'RAMAZZINA','LUCA'),
	 (15,'RANDO','ELENA'),
	 (40,'RAULE','GABRIELE'),
	 (32,'RAVAGNAN','GRETA'),
	 (18,'REAMI','ANDREA'),
	 (25,'REDI','ALBERTO'),
	 (24,'REDI','GIACOMO'),
	 (39,'RENESTO','DIEGO'),
	 (26,'RENESTO','FRANCESCO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (22,'RENESTO','GIULIA'),
	 (10,'RENESTO','LORENZO'),
	 (32,'RENESTO','NICOLA'),
	 (7,'RENESTO','PIETRO'),
	 (31,'REQUAS','OSSAMA'),
	 (38,'RESINI','TOMMASO'),
	 (37,'REZZAGHI','LORENZO'),
	 (15,'RICCIARELLI','LEONARDO'),
	 (39,'RICCIO','IRENE'),
	 (10,'RIGON','FRANCESCO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (2,'RISI','PARIDE'),
	 (5,'RIVELLI','MARCO'),
	 (16,'RIZZATO','ANNA'),
	 (2,'RIZZATO','FILIPPO'),
	 (32,'RIZZATO','GIACOMO'),
	 (2,'RIZZATO','MARCELLO'),
	 (2,'RIZZATO','PIETRO'),
	 (39,'RIZZATO','RICCARDO'),
	 (5,'RIZZI','BRIAN'),
	 (36,'RIZZI','GABRIELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (5,'RIZZIERI','MARCO'),
	 (6,'RIZZO','ALESSANDRO'),
	 (18,'RIZZO','EDEN GIOVANNI'),
	 (39,'RIZZO','EMMA'),
	 (8,'RIZZO','FRANCESCO'),
	 (22,'RIZZO','LORENZO'),
	 (38,'RIZZO','MICHELE'),
	 (12,'RIZZO','NICOLAS'),
	 (24,'RIZZO','SANTIAGO'),
	 (7,'RIZZO','VITTORIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (6,'ROBU','IONELA'),
	 (21,'ROCCATELLO','FEDERICO'),
	 (7,'ROCCATELLO','KEVIN'),
	 (22,'ROCCATELLO','NICOLAS'),
	 (25,'RODELLA','THOMAS'),
	 (37,'ROGATO','AURORA'),
	 (1,'ROMAGNOLO','ALESSANDRO'),
	 (35,'ROMAGNOLO','FEDERICO'),
	 (6,'ROMAGNOLO','SAMUELE'),
	 (9,'ROMANI','FILIPPO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (3,'ROMANI','SIMONE'),
	 (22,'ROMANINI','DAVIDE'),
	 (24,'ROMANINI','FILIPPO'),
	 (39,'RONDANIN','MARIA'),
	 (22,'RONDINA','CRISTIAN'),
	 (25,'RONDINA','ROCCO'),
	 (9,'ROSSETTO','NICCOLO'''),
	 (14,'ROSSI','ALESSANDRO'),
	 (14,'ROSSI','ANDREA'),
	 (34,'ROSSI','AURORA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (6,'ROSSI','CHRISTIAN'),
	 (24,'ROSSI','EDOARDO'),
	 (2,'ROSSI','ELISA'),
	 (9,'ROSSI','FRANCESCA'),
	 (22,'ROSSI','FRANCESCO'),
	 (4,'ROSSI','LINDA'),
	 (40,'ROSSI','MARIA GIULIA'),
	 (36,'ROSSI','MIRKO'),
	 (7,'ROSSI','TOMMASO'),
	 (18,'ROSSI','UMBERTO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (11,'ROSSIN','RICCARDO'),
	 (2,'ROSSIN','TOMMASO'),
	 (33,'ROTTA','ELIA'),
	 (16,'ROZZATO','LEONARDO'),
	 (16,'RUBIERO','PIETRO'),
	 (26,'RUSI','BESIM'),
	 (39,'RUZZA','DESIRE'''),
	 (16,'SACCHETTO','MATTEO'),
	 (12,'SACCHETTO','PIETRO'),
	 (28,'SALADINO','SAMUELE');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (28,'SALAFRICA','SOFIA'),
	 (7,'SALETTI','FILIPPO'),
	 (39,'SALETTI','GIACOMO'),
	 (12,'SALMASO','ANDREA'),
	 (9,'SALMASO','EMMA'),
	 (24,'SALMASO','GIORGIO'),
	 (11,'SALMIN','ROBERTO'),
	 (21,'SALMISTRARO','FILIPPO'),
	 (25,'SALVALAGGIO','ANDREA'),
	 (35,'SALVAN','ANTONIO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (11,'SAMB','SERIGNE MOUHAMADOU MOUSTAPHA'),
	 (35,'SANDALI','MELISSA'),
	 (25,'SANDALO','ACHILLE GIOVANNI'),
	 (19,'SANDALO','AURORA'),
	 (28,'SANDALO','MANUEL'),
	 (38,'SANTATO','FILIPPO'),
	 (27,'SANTI','LORENZO'),
	 (30,'SAONER','FRANCESCO'),
	 (17,'SARTI','GIULIO SEBASTIAN'),
	 (25,'SARTI','SHAWN');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (26,'SARTORI','FEDERICO'),
	 (29,'SARTORI','LAVINIA'),
	 (19,'SARTORI','NICOLA'),
	 (10,'SARTORI','THOMAS'),
	 (10,'SASSI','LUCA'),
	 (13,'SASSO','ANDREA'),
	 (34,'SASSO','FRANCESCO'),
	 (12,'SASSO','LORENZO'),
	 (25,'SATTIN','LEONARDO'),
	 (9,'SCALABRIN','LEONARDO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (23,'SCANAVACCA','ENRICO'),
	 (24,'SCANTAMBURLO','MATTIA'),
	 (19,'SCARANELLO','LUCA'),
	 (5,'SCARPARO','MARCO'),
	 (27,'SCARPARO','RICCARDO'),
	 (28,'SCATTOLI','NICOLA'),
	 (38,'SCHIBUOLA','DAVIDE'),
	 (4,'SECCHIERI','DIEGO'),
	 (17,'SECCHIERO','EDOARDO'),
	 (7,'SEGATO','ISOTTA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (32,'SEJADINOVSKI','TANER'),
	 (2,'SELVAGGIO','MIRCO'),
	 (21,'SENNO','MATTIA'),
	 (3,'SERVELLO','CAROLA'),
	 (38,'SESCU','DENIS'),
	 (37,'SETTE','ANGELICA'),
	 (39,'SETTE','MATTIA'),
	 (25,'SICCHIERO','ELIA'),
	 (3,'SICCHIERO','LUCA'),
	 (37,'SIGNORIN','MATTEO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (9,'SIGOLO','EMMA'),
	 (15,'SIGOLO','KEVIN MARIA'),
	 (11,'SIGOLO','THOMAS'),
	 (19,'SILIGARDI L''ERARIO','AURORA'),
	 (40,'SILVAN','MATILDE'),
	 (24,'SILVESTRIN','RICCARDO'),
	 (2,'SIMO','DAVIDE'),
	 (35,'SINIGAGLIA','ALESSANDRO'),
	 (38,'SINIGAGLIA','FEDERICO'),
	 (1,'SIVIERI','MATTIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'SMOQI','DEVIS'),
	 (9,'SOAVE','DAVIDE'),
	 (13,'SOAVE','FRANCESCO'),
	 (30,'SORGATO','ANGELICA'),
	 (7,'SORGATO','GAIA'),
	 (35,'SORGATO','GIANLUCA'),
	 (23,'SORTINO','GIACOMO'),
	 (14,'SOTTOVIA','MATTIA'),
	 (23,'SOUATI','OTMAN'),
	 (11,'SPADA','MATTIA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (5,'SPADA','NICOLO'''),
	 (12,'SPAGNOLO','THOMAS'),
	 (9,'SPOLADORI','ANDREA'),
	 (17,'SPOLLADORE','FILIPPO'),
	 (17,'SPROCATI','MATTEO'),
	 (18,'SPROCATTI','ANDREA'),
	 (14,'SQUATRITO','NOEMI ZOE'),
	 (35,'SQUATRITO','ROBERTO PAOLO'),
	 (1,'STABILIN','ANGELICA'),
	 (25,'STELLIN','LORENZO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (37,'STELLIN','MANUEL'),
	 (11,'STELLIN','MIRCO'),
	 (32,'STERZA','MATTEO'),
	 (3,'STEVANIN','JACOPO'),
	 (25,'STIEVANO','PIETRO'),
	 (16,'STOCCO','FILIPPO'),
	 (4,'STOCCO','MICHELE'),
	 (4,'STOCCO','MIRKO'),
	 (20,'STOPPA','FRANCESCA'),
	 (23,'STOPPA','GIORGIO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (20,'STOPPA','LUCA'),
	 (35,'STOPPA','MATTEO'),
	 (31,'STOPPA','MATTIA'),
	 (14,'STURARO','FILIPPO'),
	 (38,'STURARO','JACOPO'),
	 (37,'SUMAN','ALEX'),
	 (16,'SUMAN','VITTORIA'),
	 (2,'SUN','ANGELO'),
	 (31,'SURIAN','SOFIA'),
	 (16,'TACCON','ANDREA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (11,'TADIELLO','TOMMASO'),
	 (6,'TALPO','THOMAS'),
	 (39,'TAOURIRI','NIZAR'),
	 (6,'TARANTINO','MARGHERITA'),
	 (38,'TARASEK','KAROL'),
	 (27,'TARGA','ALBERTO'),
	 (6,'TARGA','DANIEL'),
	 (12,'TARGA','ELEONORA'),
	 (7,'TARGA','FRANCESCO'),
	 (21,'TARGA','KARIM');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (12,'TARGA','MARCELLO'),
	 (39,'TASSO','ACHILLE'),
	 (3,'TASSO','ENRICO'),
	 (23,'TEBALDI','GIACOMO'),
	 (3,'TEMA','NIKOLAS'),
	 (23,'TEMPESTA','ALBERTO'),
	 (9,'TEMPORIN','DENISE'),
	 (22,'TENAN','GIOELE'),
	 (13,'TENAN','GIOIA'),
	 (31,'TENAN','NICOLO''');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (9,'TENAN','NICOLO'''),
	 (25,'TESSARI','MANUEL'),
	 (13,'TESTA','NOEMI'),
	 (12,'TIBERTO','SAMUELE'),
	 (4,'TIEGHI','SOPHIE'),
	 (9,'TIMISESCU','ANDREA'),
	 (7,'TIMISESCU','CRISTIAN'),
	 (28,'TOBIJASZ','DAVID'),
	 (2,'TODIRASCU','RAZVAN STEFAN'),
	 (40,'TOFFANO','LORENZO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (22,'TOGNIN','ALICE'),
	 (28,'TOGNOLO','RICCARDO'),
	 (17,'TOMAINI','LUCA'),
	 (27,'TOMANIN','GIAMMARCO'),
	 (16,'TOMANIN','RICCARDO'),
	 (33,'TOMASELLO','MARTINO'),
	 (33,'TOMMASELLO','ERIK'),
	 (39,'TOMMASI','LEONARDO'),
	 (35,'TONELLO','MATTEO'),
	 (30,'TONIOLO','LORENZO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (21,'TONIOLO','MATTEO'),
	 (9,'TONZIELLO','JACOPO'),
	 (24,'TORCASIO','GIUSEPPE'),
	 (37,'TORKHANI','ADAM'),
	 (6,'TOSATTI','NICOLA'),
	 (16,'TOSETTI','MATTEO'),
	 (25,'TOSI','EDOARDO'),
	 (24,'TOSINI','TOMMASO'),
	 (33,'TOSO','ALBERTO'),
	 (26,'TOSO','ALESSANDRO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (16,'TOSO','GIACOMO'),
	 (28,'TOVO','GABRIELE'),
	 (36,'TOVO','MATTIA'),
	 (33,'TOZZI','ANNA'),
	 (3,'TOZZI','TOMMASO'),
	 (13,'TRAMARIN','CATERINA'),
	 (26,'TRAMARIN','NICOLA'),
	 (26,'TRAMBAIOLO','ANNA'),
	 (2,'TRAMBAIOLO','GIADA'),
	 (32,'TRENTIN','MATTEO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (40,'TRENTINI','DAVIDE'),
	 (9,'TREVISAN','DIEGO'),
	 (4,'TREVISAN','LORENZO'),
	 (11,'TREVISAN','SEBASTIANO'),
	 (26,'TREVISAN','VITTORIA'),
	 (21,'TRIVELLATO','GIUSEPPE'),
	 (9,'TRIVELLATO','MATTIA'),
	 (36,'TROMBETTA','LINDA'),
	 (36,'TROVO''','SIMONE'),
	 (24,'TURCAN','DUMITRU');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (14,'TURCAN','IULIA'),
	 (24,'TURELLA','PIETRO'),
	 (5,'TUROLLA','JACOPO'),
	 (37,'TUROLLA','MATTIA'),
	 (27,'TURRA','PIETRO'),
	 (38,'TURRA','TOMMASO'),
	 (31,'TURRI','ALESSANDRO'),
	 (38,'TURRI','BEATRICE'),
	 (37,'TURRI','LORENZO'),
	 (28,'UDEH','CLIFFORD IFYANACHO JUNIOR');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (8,'UGOCHUKWU','LENNY IKECHUKWU'),
	 (28,'UHRYN','MICHELANGELO'),
	 (20,'ULIARI','ALESSIO'),
	 (8,'UNCINI','FILIPPO'),
	 (17,'VACCARI','GIULIO'),
	 (33,'VAITI','GABRIELE'),
	 (21,'VALENTE','NICOLA'),
	 (39,'VALENTINI','MATTEO'),
	 (9,'VALENTINI','MICHELE'),
	 (19,'VANIN','NICOLO''');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (36,'VANZAN','DANIEL'),
	 (21,'VANZAN','DAVIDE'),
	 (38,'VANZELLI','LINDA'),
	 (30,'VARLAN','ANDREI MARIAN'),
	 (15,'VARVA','ALESSANDRO'),
	 (4,'VASON','FILIPPO'),
	 (4,'VEDOVETTO','ALESSANDRO'),
	 (18,'VEDOVETTO','JACOPO'),
	 (28,'VEGRO','VITTORIO'),
	 (14,'VENCO','ENRICO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (9,'VENCO','GLORIA'),
	 (27,'VENCO','THOMAS LUIGI'),
	 (25,'VENTOV','LEV'),
	 (12,'VENTURA','CHIARA'),
	 (20,'VENTURINI','AXEL'),
	 (21,'VERARDO','ANDREA'),
	 (30,'VERDE','NICOLO'''),
	 (39,'VERLICH','TOMMASO'),
	 (40,'VERONESE','ALEX'),
	 (13,'VERONESE','MATTEO ARMANDO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (2,'VERONESE','SARA'),
	 (29,'VERTULLO','ANNA'),
	 (1,'VERZA','GIACOMO'),
	 (31,'VERZA','MATTEO'),
	 (36,'VIALE','ADRIAN SHAMI'),
	 (18,'VIARO','GIACOMO'),
	 (10,'VIARO','MATTEO'),
	 (24,'VIGNOLI','JACOPO'),
	 (35,'VIGO','GRAZIA'),
	 (40,'VIOARA','VALENTIN');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (23,'VISCONTI','ANDREA'),
	 (33,'VISENTIN','DIEGO'),
	 (27,'VISENTIN','LUCA'),
	 (31,'VISENTINI','ELENI'),
	 (26,'VISENTINI','ENRICO'),
	 (40,'VISENTINI','LUCA'),
	 (20,'VISENTINI','NICOLO'''),
	 (2,'VITALI','GIOELE DIEGO'),
	 (39,'VIVENZIO','DANIEL'),
	 (23,'VIVIAN','GIACOMO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (19,'VIVOLI','JACOPO'),
	 (28,'VOGLIARDI','ELENA'),
	 (31,'VOLPE','MATILDE'),
	 (18,'VOLTAN','GIOIA'),
	 (11,'WANG','TOMMY'),
	 (11,'WEN','HANYI'),
	 (9,'WU','JACKY'),
	 (24,'XIA','XINHAO'),
	 (27,'YOUSFI','MALAK'),
	 (34,'ZAGO','EMMA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (12,'ZAGO','LORENZO'),
	 (32,'ZAGO','MARTINA'),
	 (21,'ZAMANA','MANUEL'),
	 (16,'ZAMANA','PIETRO'),
	 (1,'ZAMBELLO','COSTANZA'),
	 (1,'ZAMBELLO','IVAN'),
	 (21,'ZAMBON','ELEONORA'),
	 (4,'ZAMBON','RICCARDO'),
	 (35,'ZAMBONI','TOMMASO'),
	 (5,'ZAMPIERI','ANDREA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (20,'ZAMPIERI','GEORGE'),
	 (26,'ZAMPOLLO','FRANCESCO'),
	 (21,'ZAMPOLLO','SOFIA'),
	 (13,'ZANATTA','ELIA LEONEL'),
	 (20,'ZANDRON','ANDREA'),
	 (39,'ZANELLA','ASIA'),
	 (6,'ZANELLA','CARLO'),
	 (32,'ZANETTE','THOMAS'),
	 (5,'ZANETTI','LEONARDO'),
	 (5,'ZANFORLIN','NICOLO''');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (16,'ZANGHERATTI','ALAN'),
	 (7,'ZANGHERATTI','ALICE'),
	 (3,'ZANGHERATTI','LUCIA'),
	 (14,'ZANGIROLAMI','ANNA'),
	 (25,'ZANIRATO','DANIEL'),
	 (17,'ZANIRATO','DAVIDE'),
	 (18,'ZANIRATO','DIVINE'),
	 (19,'ZANIRATO','FILIPPO'),
	 (24,'ZANIRATO','LUCA'),
	 (24,'ZANIRATO','NICOLO''');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (34,'ZANIRATO','SWAMI'),
	 (36,'ZANOTTI','ENRICO'),
	 (14,'ZANOTTO','ALLEGRA'),
	 (21,'ZARA','LUIGI'),
	 (12,'ZECCHIN','MATTIA'),
	 (5,'ZECCHINI','GIANMARCO'),
	 (18,'ZEGGIO','ALESSIO'),
	 (2,'ZEGGIO','GIANLUCA'),
	 (4,'ZEGGIO','MANUELA'),
	 (20,'ZEN','ANNA');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (33,'ZEN','RICCARDO'),
	 (16,'ZENNARO','SAMUELE'),
	 (32,'ZERBINATI','RICCARDO'),
	 (39,'ZERBINATO','ALBERTO DINO'),
	 (5,'ZHANG','MARCO'),
	 (36,'ZHENG','HUI CHAO'),
	 (22,'ZHOU','JIA YING'),
	 (16,'ZHOU','SIMONA'),
	 (26,'ZHOU','XIANG MICHELE'),
	 (25,'ZILLI','FABIO');
INSERT INTO f5_registro_elettronico.studenti (classe_id,cognome,nome) VALUES
	 (7,'ZONZI','ALESSANDRO'),
	 (39,'ZOUBINE','ADAM'),
	 (19,'ZUOLO','CHRISTIAN');