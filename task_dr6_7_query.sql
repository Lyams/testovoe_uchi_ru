select COUNT(*) from students;

select COUNT(*) from students where name = 'Иван';

select COUNT(*) from students where created_at >= '2020-09-02 00:00:00';

select COUNT(*) from students where students.parent_id is NOT null;

select COUNT(*) from students inner join parents
on students.parent_id =  parents.id where parents.name = 'Марина';

select COUNT(*) from students where students.parent_id is null;
