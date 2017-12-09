C:\>cd sqlite2

C:\sqlite2>sqlite3.exe problem2.db
SQLite version 3.21.0 2017-10-24 18:55:49
Enter ".help" for usage hints.

drop table person;

CREATE TABLE person (
 first_name varchar,
 last_name varchar,
 home varchar
);



insert into  person  values ('Rose', 'Tyler', 'Earth');
insert into  person  values ('Zoe','Heriot','Space Station W3');
insert into  person  values ('Jo', 'Grant','Earth');
insert into  person  values ('Leela', null,'Unspecified');
insert into  person  values ( 'Romana', null,'Gallifrey');
insert into  person  values ('Clara','Oswald','Earth');
insert into  person  values ('Adric', null, 'Alzarius');
insert into  person  values ('Susan','Foreman','Gallifrey');

select * from person;





var table_data = [ { first_name : 'Rose',
                     last_name  : 'Tyler',
                     home       : 'Earth' },
                   { first_name : 'Zoe',
                     last_name  : 'Heriot',
                     home       : 'Space Station W3'},
                   { first_name : 'Jo',
                     last_name  : 'Grant',
                     home       : 'Earth'},
                   { first_name : 'Leela',
                     last_name  : null,
                     home       : 'Unspecified'},
                   { first_name : 'Romana',
                     last_name  : null,
                     home       : 'Gallifrey'},
                   { first_name : 'Clara',
                     last_name  : 'Oswald',
                     home       : 'Earth'},
                   { first_name : 'Adric',
                     last_name  : null,
                     home       : 'Alzarius'},
                   { first_name : 'Susan',
                     last_name  : 'Foreman',
                     home       : 'Gallifrey'} ];
