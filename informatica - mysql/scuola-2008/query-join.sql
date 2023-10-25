select c.id, count(*) as numero_docenti
from f5_registro_elettronico.classi c 
inner join f5_registro_elettronico.classi_docenti_materie cdm on c.id = cdm.classe_id 
inner join f5_registro_elettronico.docenti d on cdm.docente_id = d.id 
group by c.id;

select m.id , count(*) as numero_docenti
from f5_registro_elettronico.materie m 
inner join f5_registro_elettronico.classi_docenti_materie cdm on m.id = cdm.materia_id
inner join f5_registro_elettronico.docenti d on cdm.docente_id = d.id
group by m.id;

-- ogni volta che viene eseguita una query utilizzando il sgroup by, va specificato nel select l'attributo del group by
select s.classe_id, count(*) -- ricerca d
from f5_registro_elettronico.studenti s 
group by s.classe_id ; 