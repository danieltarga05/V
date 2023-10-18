create database progetto_concerto;

create table progetto_concerto.concerti
(
	id int not null auto_increment primary key,
	codice varchar(5),
	titolo varchar(50),
	descrizione varchar(100),
	data_concerto datetime
);