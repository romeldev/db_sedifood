create or replace view companies as
select id_almacen as id, nombre as descrip, IF(estado=1, NULL, 0) as deleted_at from almacen;

create or replace view foods as
select id_insumo as id, nombre as descrip, 1 as food_group_id, if(estado=1,null, 0) as deleted_at from insumo;