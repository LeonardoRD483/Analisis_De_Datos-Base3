create table dim_tiempo(
    id_tiempo serial primary key not null,
    año int,
    mes int,
    dia int,
    hora int,
    minuto int,
    segundo int
);

create table dim_curso(
	id_curso serial primary key not null,
	id_tbl_curso int,
	nombre_curso varchar(500)
);

create table dim_user(
    id_usuario serial primary key not null,
    id_tbl_user int,
    nombre varchar,
    apellido varchar
);

create table dim_acceso(
    id_acceso serial primary key not null,
    origin varchar
);

create table dim_ubicacion(
    id_ubicacion serial primary key not null,
    ip varchar,
    ip_A int,
    ip_B int,
    ip_C int,
    ip_D int
);

create table dim_accion(
    id_accion serial primary key not null,
    target varchar,
    action varchar,
    component varchar
);

create table tbl_hecho(
    id_hecho serial primary key not null,
    id_dim_tiempo int,
    id_dim_curso int,
    id_dim_user int,
    id_dim_acceso int,
    id_dim_ubicacion int,
    id_dim_accion int,
    cantidad_accesos int,
    cantidad_acciones int
);
alter table tbl_hecho add foreign key(id_dim_tiempo) references dim_tiempo(id_tiempo);
alter table tbl_hecho add foreign key(id_dim_curso) references dim_curso(id_curso);
alter table tbl_hecho add foreign key(id_dim_user) references dim_user(id_usuario);
alter table tbl_hecho add foreign key(id_dim_acceso) references dim_acceso(id_acceso);
alter table tbl_hecho add foreign key(id_dim_ubicacion) references dim_ubicacion(id_ubicacion);
alter table tbl_hecho add foreign key(id_dim_accion) references dim_accion(id_accion);

select * from dim_curso;
insert into dim_curso(id_tbl_curso,nombre_curso) values (0,'vacion');
insert into dim_curso(id_tbl_curso,nombre_curso) values (2,'eliminado');

select * from dim_user;
insert into dim_user(id_tbl_user,nombre,apellido) values(-1,'indefinido','');
insert into dim_user(id_tbl_user,nombre,apellido) values(0,'cero','');

select * from dim_ubicacion;

select * from dim_acceso;

select * from dim_accion;

select * from dim_tiempo;