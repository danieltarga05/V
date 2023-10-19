create database organizzazione_concerti;

create table organizzazione_concerti.concerti
(
	id int not null auto_increment primary key,
	codice varchar(5),
	titolo varchar(50),
	descrizione varchar(100),
	data_concerto datetime
);

/*delete from progetto_concerto.concerti
where id = 5 ;*/

-- delete from progetto_concerto.concerti ;