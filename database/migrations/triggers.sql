CREATE TRIGGER `td_cajas_movimientos` BEFORE DELETE ON `cajas_movimientos`
 FOR EACH ROW BEGIN
declare  float;
declare  float;
declare  date;
declare  int;

set  = old.ingresa;
set  = old.retira;
set  = old.fecha;
set  = old.id_almacen;

if ( > 0) then
    update cajas as c 
    set c.o_ingresos = c.o_ingresos - , c.m_sistema = c.m_sistema -   
    where c.id_almacen =  and c.fecha = ;
end if;

if ( > 0) then
	update cajas as c 
    set c.gastos_varios = c.gastos_varios - , c.m_sistema = c.m_sistema +   
    where c.id_almacen =  and c.fecha = ;
end if;

END

CREATE TRIGGER `td_productos_ingresos` BEFORE DELETE ON `productos_ingresos`
 FOR EACH ROW BEGIN
declare  int;
declare  int;
declare  date;
declare  int;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  double;
declare  double;

declare  int;
declare  double;
declare  double;
declare  decimal(10,3);

declare  int;
declare  int;
declare  decimal(24,16);

set  = old.id_producto;
set  = old.cantidad;
set  = old.precio;
set  = old.costo;
set  = old.id_ingreso;
set  = old.periodo;
set  = 0;

select i.fecha, i.id_almacen, i.id_proveedor, i.id_tido, i.serie, i.numero, i.tc, i.id_usuarios, i.total  
into , , , , , , , ,  
from ingresos as i 
where i.id_ingreso =  and i.periodo = ;

set  =  * ;

update productos 
set ctotal = ctotal -   
where id_producto = ;

update productos_almacen 
set cactual = cactual -   
where id_almacen =  and id_producto = ;
    
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;


select ifnull(max(id_kardex) + 1, 1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;
SET time_zone='America/Lima';
insert into kardex_productos 
values (, , , , 6, 0, , 0, , , , , , CURRENT_TIMESTAMP(), );
END

CREATE TRIGGER `td_productos_traslados` BEFORE DELETE ON `productos_traslados`
 FOR EACH ROW begin
declare  int;
declare  date;
declare  int;
declare  int;

declare  int;
declare  int;

declare  int;
declare  int;
declare  decimal(24,16);
declare  double(24,16);

declare  float;

declare  int;
declare  decimal(24,16);

set  = old.id_traslado;
set  = old.id_producto;
set  = old.c_enviado;

select t.fecha, t.a_origen, t.a_destino, t.u_envia, t.estado 
into , , , ,   
from traslados as t 
where t.id_traslado = ;


update productos_almacen
set cactual = cactual +  
where id_almacen =  and id_producto = ;


select p.costo 
into  
from productos as p 
where p.id_producto = ;
/*creacion del kardex*/

select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 19, , 0, , 0,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );
/*fin del kardex*/



end

CREATE TRIGGER `td_productos_ventas` BEFORE DELETE ON `productos_ventas`
 FOR EACH ROW BEGIN
DECLARE  int;
declare  int;
declare  int;
declare  decimal(24,16);
declare  float;

declare  date;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  int;
declare  int;
declare  decimal(24,16);

set  = old.id_almacen;
set  = old.id_ventas;
set  = old.id_producto;
set  = old.cantidad;
set  = old.precio;


select v.fecha, v.id_tido, v.serie, v.numero, v.id_usuarios, v.tipo_venta, v.estado 
into , , , , , ,  
from ventas as v 
where v.id_ventas =  and v.id_almacen = ;

if ( = 1) then
update productos_almacen 
set cactual = cactual +  
where id_almacen =  and id_producto = ;

update productos 
set productos.ctotal = ctotal +  
where productos.id_producto = ;

select pa.cactual
into 
from productos_almacen pa
where pa.id_almacen =  and pa.id_producto = ;

select ifnull(max(id_kardex) + 1, 1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;
SET time_zone='America/Lima';
insert into kardex_productos 
values (, , , , 5, , 0, , 0, , , , ,CURRENT_TIMESTAMP(), );
end if;

END

CREATE TRIGGER `td_ventas_cobros` BEFORE DELETE ON `ventas_cobros`
 FOR EACH ROW BEGIN
declare  int;
declare  int;
declare  date;
declare  float;
declare  int;
declare  int;

declare  int;
declare  date;

declare  float;
declare  float;

set  = old.id_ventas;
set  = old.id_almacen;
set  = old.fecha;
set  = old.monto;
set  = old.tipo_pago;

select v.id_cliente, v.fecha, v.estado
into , , 
from ventas as v 
where v.id_ventas =  and v.id_almacen = ;

set  = 0.0;
set  = 0.0;

IF ( = 1) THEN
	update clientes 
	set pago = pago - 
    where id_cliente = ;
    
    if ( > ) then
		set  = 0.0;
        set  = ;
    end if;
    
    if ( = ) then
		set  = ;
        set  = 0.0;
    end if;
    
    update cajas
    set cajas.ing_venta = cajas.ing_venta - , cajas.cobro_venta = cajas.cobro_venta - , cajas.m_sistema = cajas.m_sistema -   
    where cajas.id_almacen =  and cajas.fecha = ;
    
END IF;

IF  = 3 THEN
	update cajas
    set uso_cupon = uso_cupon -  
    where id_almacen =  and fecha = ;
END IF;

update clientes 
set pago = pago -  
where clientes.id_cliente = ;

if ( != 3) then
update ventas 
set pagado = pagado - , estado = 2 
where id_ventas =  and id_almacen = ;
else 
update ventas 
set pagado = pagado -  
where id_ventas =  and id_almacen = ;
end if;

END

CREATE TRIGGER `ti_cajas_movimientos` AFTER INSERT ON `cajas_movimientos`
 FOR EACH ROW BEGIN
declare  float;
declare  float;
declare  date;

declare  int;

set  = new.ingresa;
set  = new.retira;
set  = new.fecha;
set  = new.id_almacen;

if ( > 0) then
    update cajas as c 
    set c.o_ingresos = c.o_ingresos + , c.m_sistema = c.m_sistema +   
    where c.id_almacen =  and c.fecha = ;
end if;

if ( > 0) then
	update cajas as c 
    set c.gastos_varios = c.gastos_varios + , c.m_sistema = c.m_sistema -   
    where c.id_almacen =  and c.fecha = ;
end if;

END

CREATE TRIGGER `ti_guia_remision` AFTER INSERT ON `guia_remision`
 FOR EACH ROW BEGIN
declare  int;

set  = new.id_almacen;

update documentos_almacen set documentos_almacen.numero = numero + 1 where documentos_almacen.id_tido = 5 and documentos_almacen.id_almacen = ;
END

CREATE TRIGGER `ti_productos_ingresos` AFTER INSERT ON `productos_ingresos`
 FOR EACH ROW BEGIN
declare  int;
declare  int;
declare  date;
declare  int;
declare  int;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  double;
declare  double;

declare  int;
declare  double;
declare  double;
declare  decimal(10,3);
declare  decimal(24,16);

declare  int;
declare  int;

set  = new.id_producto;
set  = new.cantidad;
set  = new.precio;
set  = new.costo;
set  = new.id_ingreso;
set  = new.periodo;
set  = 0;

select i.fecha, i.id_almacen, al.id_empresa, i.id_proveedor, i.id_tido, i.serie, i.numero, i.tc, i.id_usuarios, i.total  
into , , , , , , , , ,  
from ingresos as i 
inner join almacen as al on al.id_almacen = i.id_almacen
where i.id_ingreso =  and i.periodo = ;

set  =  * ;

update productos 
set id_proveedor = , costo = , precio = , ctotal = ctotal +   
where id_producto = ;

update productos_empresa 
set precio =  
where id_producto =  and id_empresa = ;

select count(*) 
into  
from productos_almacen 
where id_almacen =  and id_producto = ;

if ( > 0) then
    update productos_almacen 
    set cactual = cactual + , f_infreso =  
    where id_almacen =  and id_producto = ;
    
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;
    
    
else 
    insert into productos_almacen 
    values (, , , , "1000-01-01");
    
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;
    
end if;

set  =  * ;
update proveedor 
set tcompra = tcompra +  
where id_proveedor = ;

select ifnull(max(id_kardex) + 1, 1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;
SET time_zone='America/Lima';
insert into kardex_productos 
values (, , , , 2, , 0, , 0, , , , , CURRENT_TIMESTAMP(), );
END

CREATE TRIGGER `ti_productos_inventario` AFTER INSERT ON `productos_inventario`
 FOR EACH ROW begin
declare  decimal(24,16);
declare  decimal(24,16);
declare  int;
declare  int;
declare  int;
declare  int;
declare  int;
declare  date;
declare  int;

declare  int;

declare  decimal(24,16);
DECLARE  decimal(24,16);
declare  decimal(24,16);
declare  float;
declare  float;
declare  int;
declare  varchar(145);
declare  decimal(24,16);

set  = new.cant_fisico;
set  = new.id_almacen;
set  = new.id_producto;
set  = new.cant_actual;
set  = new.id_inventario;
set  = new.anio;

select i.fecha, i.id_usuarios 
into ,  
from inventario as i 
where i.id_inventario =  and i.anio =  and i.id_almacen = ;

select count(*) 
into  
from productos_almacen 
where id_almacen =  and id_producto = ;

if ( > 0) then
	update productos_almacen set cactual =  
	where id_producto =  and id_almacen = ;
else 
    insert into productos_almacen 
    values (, , , "1000-01-01", ) ;
   
end if;

set  =  - ;
set  = 0;
set  = 0;
set  = 0;
set  = 0;
set  = 5;
set  = null;

update productos as p 
set p.ctotal = p.ctotal +  
where p.id_producto = ;

if ( > 0) then
    set  = "POR AUMENTO PARA CUADRE";
    set  = 0;
    set  = ;
    set  = 0;
    set  = 0;
end if;

if ( < 0) then 
    set  = "POR DISMINUCION PARA CUADRE";
    set  =  - ;
    set  = ;
    set  = 0;
    set  = 0;
    set  = 0;
end if;

select ifnull (max(id_kardex)+ 1,1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;

if ( > 0 ||  < 0 ||  = 0) THEN

select pa.cactual
into  
from productos_almacen pa
where pa.id_almacen =  and pa.id_producto = ;


SET time_zone='America/Lima';
insert into kardex_productos Values (, , , , 14, , , , , 9, , , , now(), );
end if;

end

CREATE TRIGGER `ti_productos_salida` AFTER INSERT ON `productos_salida`
 FOR EACH ROW BEGIN
DECLARE  int;
declare  int;
declare  int;
declare  decimal(24,16);




declare  date;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  decimal(24,16);
declare  int;

set  = new.id_almacen;
set  = new.id_salida;
set  = new.id_producto;
set  = new.cantidad_almacen;


select s.fecha, s.id_tido, s.serie, s.numero, s.id_usuarios, s.id_tipo_movimiento
into , , , , , 
from salida as s 
where s.id_salida =  and s.id_almacen = ;

	update productos_almacen 
	set cactual = cactual - , f_salida = 
	where id_almacen =  and id_producto = ;
    
    select pa.cactual
    into 
    from productos_almacen pa
    where pa.id_almacen =  and pa.id_producto = ;
    
    update productos 
    set productos.ctotal = ctotal -  
    where productos.id_producto = ;

	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
	insert into kardex_productos 
	values (, , , , , 0, , 0, 0, , , , , CURRENT_TIMESTAMP(),);
    


END

CREATE TRIGGER `ti_productos_traslados` AFTER INSERT ON `productos_traslados`
 FOR EACH ROW begin
declare  int;
declare  date;
declare  int;
declare  int;

declare  int;
declare  int;

declare  int;
declare  int;
declare  decimal(10,3);
declare  decimal(10,3);
declare  decimal(24,16);

declare  float;

declare  int;

set  = new.id_traslado;
set  = new.id_producto;
set  = new.c_enviado;

select t.fecha, t.a_origen, t.a_destino, t.u_envia, t.estado 
into , , , ,   
from traslados as t 
where t.id_traslado = ;


update productos_almacen
set cactual = cactual - , f_salida =  
where id_almacen =  and id_producto = ;



select p.costo 
into  
from productos as p 
where p.id_producto = ;

/*creacion del kardex*/

select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 11, 0, , 0, ,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );
/*fin del kardex*/
end

CREATE TRIGGER `ti_productos_ventas` AFTER INSERT ON `productos_ventas`
 FOR EACH ROW BEGIN
DECLARE  int;
declare  int;
declare  int;
declare  decimal(24,16);
declare  float;

declare  date;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  int;
declare  decimal(24,16);

set  = new.id_almacen;
set  = new.id_ventas;
set  = new.id_producto;
set  = new.cantidad;
set  = new.precio;

select v.fecha, v.id_tido, v.serie, v.numero, v.id_usuarios, v.tipo_venta 
into , , , , ,  
from ventas as v 
where v.id_ventas =  and v.id_almacen = ;

if( = 1)then
	update productos_almacen 
	set cactual = cactual - , f_salida = 
	where id_almacen =  and id_producto = ;
    
	select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;
    
    update productos 
    set productos.ctotal = ctotal -  
    where productos.id_producto = ;

	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 1, 0, , 0, , , , , , CURRENT_TIMESTAMP(), );
    
END IF;

END

CREATE TRIGGER `ti_salida` AFTER INSERT ON `salida`
 FOR EACH ROW BEGIN


declare  date;


declare  int;
declare  int;


set  = new.fecha;

set  = new.id_tido;
set  = new.id_almacen;



update documentos_almacen set numero = numero +1 where id_tido =  and id_almacen = ;


END

CREATE TRIGGER `ti_ventas` AFTER INSERT ON `ventas`
 FOR EACH ROW BEGIN
declare  int;
declare  double;
declare  date;
declare  int;

declare  int;
declare  int;

set  = new.id_cliente;
set  = new.total;
set  = new.fecha;
set  = new.tipo_venta;

set  = new.id_tido;
set  = new.id_almacen;

update clientes 
set venta = venta + , ultima_venta =  
where id_cliente = ;

update documentos_almacen set numero = numero +1 where id_tido =  and id_almacen = ;


END

CREATE TRIGGER `ti_ventas_cobros` AFTER INSERT ON `ventas_cobros`
 FOR EACH ROW BEGIN
declare  int;
declare  int;
declare  date;
declare  float;
declare  int;

declare  int;
declare  date;

declare  float;
declare  float;

set  = new.id_ventas;
set  = new.id_almacen;
set  = new.fecha;
set  = new.monto;
set  = new.tipo_pago;

select v.id_cliente, v.fecha
into , 
from ventas as v 
where v.id_ventas =  and v.id_almacen = ;

set  = 0.0;
set  = 0.0;

IF ( = 1) THEN
	update clientes 
	set pago = pago + 
    where id_cliente = ;
    
    if ( > ) then
		set  = 0.0;
        set  = ;
    end if;
    
    if ( = ) then
		set  = ;
        set  = 0.0;
    end if;
    
    update cajas
    set cajas.ing_venta = cajas.ing_venta + , cajas.cobro_venta = cajas.cobro_venta + , cajas.m_sistema = cajas.m_sistema +   
    where cajas.id_almacen =  and cajas.fecha = ;
    
END IF;

IF ( = 2) THEN
	update clientes 
	set pago = pago + 
    where id_cliente = ;
    
    update cajas
    set cajas.venta_banco = cajas.venta_banco +  
    where cajas.id_almacen =  and cajas.fecha = ;
    
END IF;

IF  = 3 THEN
	update cajas
    set uso_cupon = uso_cupon +  
    where id_almacen =  and fecha = ;
END IF;

update clientes 
set pago = pago +  
where clientes.id_cliente = ;

update ventas 
set pagado = pagado +  
where id_ventas =  and id_almacen = ;

update ventas 
set estado = 1 
where id_ventas =  and id_almacen =  and pagado = total;

END

CREATE TRIGGER `tu_productos_salida` BEFORE DELETE ON `productos_salida`
 FOR EACH ROW BEGIN
DECLARE  int;
declare  int;
declare  int;
declare  decimal(24,16);

declare  date;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  int;
declare  int;
declare  decimal(24,16);

set  = old.id_almacen;
set  = old.id_salida;
set  = old.id_producto;
set  = old.cantidad;



select s.fecha, s.id_tido, s.serie, s.numero, s.id_usuarios, s.estado 
into , , , , ,   
from salida  as s 
where s.id_salida =  and s.id_almacen = ;


update productos_almacen 
set cactual = cactual +  
where id_almacen =  and id_producto = ;

update productos 
set productos.ctotal = ctotal +  
where productos.id_producto = ;

select pa.cactual
into 
from productos_almacen pa
where pa.id_almacen =  and pa.id_producto = ;

select ifnull(max(id_kardex) + 1, 1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;

insert into kardex_productos 
values (, , , , 17, , 0, 0, 0, , , , , CURRENT_TIMESTAMP(), );

END

CREATE TRIGGER `tu_productos_traslados` BEFORE UPDATE ON `productos_traslados`
 FOR EACH ROW begin
declare  int;
declare  date;
declare  int;

declare  int;
declare  int;

declare  int;
declare  decimal(10,3);
declare  decimal(10,3);
declare  decimal(10,3);
declare  decimal(24,16);
declare  float;
declare  int;

declare  int;

set  = old.id_traslado;
set  = old.id_producto;
set  = old.c_enviado;
set  = new.c_recibido;
set  =  - ;
set  = 0;

if ( > 0) then
select t.fecha, t.a_destino, t.a_origen, t.u_recibe 
into , , , 
from traslados as t 
where t.id_traslado = ;


select count(*) 
into  
from productos_almacen 
where id_producto =  and id_almacen = ;


if ( > 0) then
    update productos_almacen
    set cactual = cactual + , f_infreso =  
    where id_almacen =  and id_producto = ;

   /* crear el kardex del almacen llegada*/
   select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 11, , 0, , 0,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );
    
    
   
   
   /*fin de kardex*/





else 
	insert into productos_almacen 
    values (, , , , "1000-01-01");
	  /* crear el kardex del almacen llegada cuando es nuevo*/
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 11, , 0, , 0,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );

   /*fin de kardex*/
	
	
end if;


select p.costo 
into  
from productos as p 
where p.id_producto = ;


if ( > 0) then
	update productos_almacen
    set cactual = cactual +  
    where id_almacen =  and id_producto = ;
   /* crear kardex cuando hay devolucion*/ 
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 19, , 0, , 0,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );
     /* fin de creacion de kardex*/ 
    update traslados 
    set estado = 4 
    where id_traslado = ;
end if;
end if;
end

CREATE TRIGGER `tu_ventas` AFTER UPDATE ON `ventas`
 FOR EACH ROW BEGIN
declare  int;
declare  double;
declare  date;
declare  int;
declare  int;

declare  int;
declare  int;

set  = old.id_cliente;
set  = old.total;
set  = old.fecha;
set  = old.tipo_venta;

set  = old.id_tido;
set  = old.id_almacen;
set  = new.estado;

if ( = 3) then
    update clientes 
    set venta = venta -   
    where id_cliente = ;
end if;

END

CREATE TRIGGER `td_productos_ingresos` BEFORE DELETE ON `productos_ingresos`
 FOR EACH ROW BEGIN
declare  int;
declare  int;
declare  date;
declare  int;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  double;
declare  double;

declare  int;
declare  double;
declare  double;
declare  decimal(10,3);

declare  int;
declare  int;
declare  decimal(24,16);

set  = old.id_producto;
set  = old.cantidad;
set  = old.precio;
set  = old.costo;
set  = old.id_ingreso;
set  = old.periodo;
set  = 0;

select i.fecha, i.id_almacen, i.id_proveedor, i.id_tido, i.serie, i.numero, i.tc, i.id_usuarios, i.total  
into , , , , , , , ,  
from ingresos as i 
where i.id_ingreso =  and i.periodo = ;

set  =  * ;

update productos 
set ctotal = ctotal -   
where id_producto = ;

update productos_almacen 
set cactual = cactual -   
where id_almacen =  and id_producto = ;
    
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;


select ifnull(max(id_kardex) + 1, 1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;
SET time_zone='America/Lima';
insert into kardex_productos 
values (, , , , 6, 0, , 0, , , , , , CURRENT_TIMESTAMP(), );
END

CREATE TRIGGER `td_productos_traslados` BEFORE DELETE ON `productos_traslados`
 FOR EACH ROW begin
declare  int;
declare  date;
declare  int;
declare  int;

declare  int;
declare  int;

declare  int;
declare  int;
declare  decimal(24,16);
declare  double(24,16);

declare  float;

declare  int;
declare  decimal(24,16);

set  = old.id_traslado;
set  = old.id_producto;
set  = old.c_enviado;

select t.fecha, t.a_origen, t.a_destino, t.u_envia, t.estado 
into , , , ,   
from traslados as t 
where t.id_traslado = ;


update productos_almacen
set cactual = cactual +  
where id_almacen =  and id_producto = ;


select p.costo 
into  
from productos as p 
where p.id_producto = ;
/*creacion del kardex*/

select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 19, , 0, , 0,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );
/*fin del kardex*/



end

CREATE TRIGGER `td_productos_ventas` BEFORE DELETE ON `productos_ventas`
 FOR EACH ROW BEGIN
DECLARE  int;
declare  int;
declare  int;
declare  decimal(24,16);
declare  float;

declare  date;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  int;
declare  int;
declare  decimal(24,16);

set  = old.id_almacen;
set  = old.id_ventas;
set  = old.id_producto;
set  = old.cantidad;
set  = old.precio;


select v.fecha, v.id_tido, v.serie, v.numero, v.id_usuarios, v.tipo_venta, v.estado 
into , , , , , ,  
from ventas as v 
where v.id_ventas =  and v.id_almacen = ;

if ( = 1) then
update productos_almacen 
set cactual = cactual +  
where id_almacen =  and id_producto = ;

update productos 
set productos.ctotal = ctotal +  
where productos.id_producto = ;

select pa.cactual
into 
from productos_almacen pa
where pa.id_almacen =  and pa.id_producto = ;

select ifnull(max(id_kardex) + 1, 1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;
SET time_zone='America/Lima';
insert into kardex_productos 
values (, , , , 5, , 0, , 0, , , , ,CURRENT_TIMESTAMP(), );
end if;

END

CREATE TRIGGER `td_ventas_cobros` BEFORE DELETE ON `ventas_cobros`
 FOR EACH ROW BEGIN
declare  int;
declare  int;
declare  date;
declare  float;
declare  int;
declare  int;

declare  int;
declare  date;

declare  float;
declare  float;

set  = old.id_ventas;
set  = old.id_almacen;
set  = old.fecha;
set  = old.monto;
set  = old.tipo_pago;

select v.id_cliente, v.fecha, v.estado
into , , 
from ventas as v 
where v.id_ventas =  and v.id_almacen = ;

set  = 0.0;
set  = 0.0;

IF ( = 1) THEN
	update clientes 
	set pago = pago - 
    where id_cliente = ;
    
    if ( > ) then
		set  = 0.0;
        set  = ;
    end if;
    
    if ( = ) then
		set  = ;
        set  = 0.0;
    end if;
    
    update cajas
    set cajas.ing_venta = cajas.ing_venta - , cajas.cobro_venta = cajas.cobro_venta - , cajas.m_sistema = cajas.m_sistema -   
    where cajas.id_almacen =  and cajas.fecha = ;
    
END IF;

IF  = 3 THEN
	update cajas
    set uso_cupon = uso_cupon -  
    where id_almacen =  and fecha = ;
END IF;

update clientes 
set pago = pago -  
where clientes.id_cliente = ;

if ( != 3) then
update ventas 
set pagado = pagado - , estado = 2 
where id_ventas =  and id_almacen = ;
else 
update ventas 
set pagado = pagado -  
where id_ventas =  and id_almacen = ;
end if;

END

CREATE TRIGGER `ti_cajas_movimientos` AFTER INSERT ON `cajas_movimientos`
 FOR EACH ROW BEGIN
declare  float;
declare  float;
declare  date;

declare  int;

set  = new.ingresa;
set  = new.retira;
set  = new.fecha;
set  = new.id_almacen;

if ( > 0) then
    update cajas as c 
    set c.o_ingresos = c.o_ingresos + , c.m_sistema = c.m_sistema +   
    where c.id_almacen =  and c.fecha = ;
end if;

if ( > 0) then
	update cajas as c 
    set c.gastos_varios = c.gastos_varios + , c.m_sistema = c.m_sistema -   
    where c.id_almacen =  and c.fecha = ;
end if;

END

CREATE TRIGGER `ti_guia_remision` AFTER INSERT ON `guia_remision`
 FOR EACH ROW BEGIN
declare  int;

set  = new.id_almacen;

update documentos_almacen set documentos_almacen.numero = numero + 1 where documentos_almacen.id_tido = 5 and documentos_almacen.id_almacen = ;
END

CREATE TRIGGER `ti_productos_ingresos` AFTER INSERT ON `productos_ingresos`
 FOR EACH ROW BEGIN
declare  int;
declare  int;
declare  date;
declare  int;
declare  int;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  double;
declare  double;

declare  int;
declare  double;
declare  double;
declare  decimal(10,3);
declare  decimal(24,16);

declare  int;
declare  int;

set  = new.id_producto;
set  = new.cantidad;
set  = new.precio;
set  = new.costo;
set  = new.id_ingreso;
set  = new.periodo;
set  = 0;

select i.fecha, i.id_almacen, al.id_empresa, i.id_proveedor, i.id_tido, i.serie, i.numero, i.tc, i.id_usuarios, i.total  
into , , , , , , , , ,  
from ingresos as i 
inner join almacen as al on al.id_almacen = i.id_almacen
where i.id_ingreso =  and i.periodo = ;

set  =  * ;

update productos 
set id_proveedor = , costo = , precio = , ctotal = ctotal +   
where id_producto = ;

update productos_empresa 
set precio =  
where id_producto =  and id_empresa = ;

select count(*) 
into  
from productos_almacen 
where id_almacen =  and id_producto = ;

if ( > 0) then
    update productos_almacen 
    set cactual = cactual + , f_infreso =  
    where id_almacen =  and id_producto = ;
    
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;
    
    
else 
    insert into productos_almacen 
    values (, , , , "1000-01-01");
    
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;
    
end if;

set  =  * ;
update proveedor 
set tcompra = tcompra +  
where id_proveedor = ;

select ifnull(max(id_kardex) + 1, 1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;
SET time_zone='America/Lima';
insert into kardex_productos 
values (, , , , 2, , 0, , 0, , , , , CURRENT_TIMESTAMP(), );
END

CREATE TRIGGER `ti_productos_inventario` AFTER INSERT ON `productos_inventario`
 FOR EACH ROW begin
declare  decimal(24,16);
declare  decimal(24,16);
declare  int;
declare  int;
declare  int;
declare  int;
declare  int;
declare  date;
declare  int;

declare  int;

declare  decimal(24,16);
DECLARE  decimal(24,16);
declare  decimal(24,16);
declare  float;
declare  float;
declare  int;
declare  varchar(145);
declare  decimal(24,16);

set  = new.cant_fisico;
set  = new.id_almacen;
set  = new.id_producto;
set  = new.cant_actual;
set  = new.id_inventario;
set  = new.anio;

select i.fecha, i.id_usuarios 
into ,  
from inventario as i 
where i.id_inventario =  and i.anio =  and i.id_almacen = ;

select count(*) 
into  
from productos_almacen 
where id_almacen =  and id_producto = ;

if ( > 0) then
	update productos_almacen set cactual =  
	where id_producto =  and id_almacen = ;
else 
    insert into productos_almacen 
    values (, , , "1000-01-01", ) ;
   
end if;

set  =  - ;
set  = 0;
set  = 0;
set  = 0;
set  = 0;
set  = 5;
set  = null;

update productos as p 
set p.ctotal = p.ctotal +  
where p.id_producto = ;

if ( > 0) then
    set  = "POR AUMENTO PARA CUADRE";
    set  = 0;
    set  = ;
    set  = 0;
    set  = 0;
end if;

if ( < 0) then 
    set  = "POR DISMINUCION PARA CUADRE";
    set  =  - ;
    set  = ;
    set  = 0;
    set  = 0;
    set  = 0;
end if;

select ifnull (max(id_kardex)+ 1,1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;

if ( > 0 ||  < 0 ||  = 0) THEN

select pa.cactual
into  
from productos_almacen pa
where pa.id_almacen =  and pa.id_producto = ;


SET time_zone='America/Lima';
insert into kardex_productos Values (, , , , 14, , , , , 9, , , , now(), );
end if;

end

CREATE TRIGGER `ti_productos_salida` AFTER INSERT ON `productos_salida`
 FOR EACH ROW BEGIN
DECLARE  int;
declare  int;
declare  int;
declare  decimal(24,16);




declare  date;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  decimal(24,16);
declare  int;

set  = new.id_almacen;
set  = new.id_salida;
set  = new.id_producto;
set  = new.cantidad_almacen;


select s.fecha, s.id_tido, s.serie, s.numero, s.id_usuarios, s.id_tipo_movimiento
into , , , , , 
from salida as s 
where s.id_salida =  and s.id_almacen = ;

	update productos_almacen 
	set cactual = cactual - , f_salida = 
	where id_almacen =  and id_producto = ;
    
    select pa.cactual
    into 
    from productos_almacen pa
    where pa.id_almacen =  and pa.id_producto = ;
    
    update productos 
    set productos.ctotal = ctotal -  
    where productos.id_producto = ;

	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
	insert into kardex_productos 
	values (, , , , , 0, , 0, 0, , , , , CURRENT_TIMESTAMP(),);
    


END

CREATE TRIGGER `ti_productos_traslados` AFTER INSERT ON `productos_traslados`
 FOR EACH ROW begin
declare  int;
declare  date;
declare  int;
declare  int;

declare  int;
declare  int;

declare  int;
declare  int;
declare  decimal(10,3);
declare  decimal(10,3);
declare  decimal(24,16);

declare  float;

declare  int;

set  = new.id_traslado;
set  = new.id_producto;
set  = new.c_enviado;

select t.fecha, t.a_origen, t.a_destino, t.u_envia, t.estado 
into , , , ,   
from traslados as t 
where t.id_traslado = ;


update productos_almacen
set cactual = cactual - , f_salida =  
where id_almacen =  and id_producto = ;



select p.costo 
into  
from productos as p 
where p.id_producto = ;

/*creacion del kardex*/

select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 11, 0, , 0, ,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );
/*fin del kardex*/
end

CREATE TRIGGER `ti_productos_ventas` AFTER INSERT ON `productos_ventas`
 FOR EACH ROW BEGIN
DECLARE  int;
declare  int;
declare  int;
declare  decimal(24,16);
declare  float;

declare  date;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  int;
declare  decimal(24,16);

set  = new.id_almacen;
set  = new.id_ventas;
set  = new.id_producto;
set  = new.cantidad;
set  = new.precio;

select v.fecha, v.id_tido, v.serie, v.numero, v.id_usuarios, v.tipo_venta 
into , , , , ,  
from ventas as v 
where v.id_ventas =  and v.id_almacen = ;

if( = 1)then
	update productos_almacen 
	set cactual = cactual - , f_salida = 
	where id_almacen =  and id_producto = ;
    
	select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;
    
    update productos 
    set productos.ctotal = ctotal -  
    where productos.id_producto = ;

	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 1, 0, , 0, , , , , , CURRENT_TIMESTAMP(), );
    
END IF;

END

CREATE TRIGGER `ti_salida` AFTER INSERT ON `salida`
 FOR EACH ROW BEGIN


declare  date;


declare  int;
declare  int;


set  = new.fecha;

set  = new.id_tido;
set  = new.id_almacen;



update documentos_almacen set numero = numero +1 where id_tido =  and id_almacen = ;


END

CREATE TRIGGER `ti_ventas` AFTER INSERT ON `ventas`
 FOR EACH ROW BEGIN
declare  int;
declare  double;
declare  date;
declare  int;

declare  int;
declare  int;

set  = new.id_cliente;
set  = new.total;
set  = new.fecha;
set  = new.tipo_venta;

set  = new.id_tido;
set  = new.id_almacen;

update clientes 
set venta = venta + , ultima_venta =  
where id_cliente = ;

update documentos_almacen set numero = numero +1 where id_tido =  and id_almacen = ;


END

CREATE TRIGGER `ti_ventas_cobros` AFTER INSERT ON `ventas_cobros`
 FOR EACH ROW BEGIN
declare  int;
declare  int;
declare  date;
declare  float;
declare  int;

declare  int;
declare  date;

declare  float;
declare  float;

set  = new.id_ventas;
set  = new.id_almacen;
set  = new.fecha;
set  = new.monto;
set  = new.tipo_pago;

select v.id_cliente, v.fecha
into , 
from ventas as v 
where v.id_ventas =  and v.id_almacen = ;

set  = 0.0;
set  = 0.0;

IF ( = 1) THEN
	update clientes 
	set pago = pago + 
    where id_cliente = ;
    
    if ( > ) then
		set  = 0.0;
        set  = ;
    end if;
    
    if ( = ) then
		set  = ;
        set  = 0.0;
    end if;
    
    update cajas
    set cajas.ing_venta = cajas.ing_venta + , cajas.cobro_venta = cajas.cobro_venta + , cajas.m_sistema = cajas.m_sistema +   
    where cajas.id_almacen =  and cajas.fecha = ;
    
END IF;

IF ( = 2) THEN
	update clientes 
	set pago = pago + 
    where id_cliente = ;
    
    update cajas
    set cajas.venta_banco = cajas.venta_banco +  
    where cajas.id_almacen =  and cajas.fecha = ;
    
END IF;

IF  = 3 THEN
	update cajas
    set uso_cupon = uso_cupon +  
    where id_almacen =  and fecha = ;
END IF;

update clientes 
set pago = pago +  
where clientes.id_cliente = ;

update ventas 
set pagado = pagado +  
where id_ventas =  and id_almacen = ;

update ventas 
set estado = 1 
where id_ventas =  and id_almacen =  and pagado = total;

END

CREATE TRIGGER `tu_productos_salida` BEFORE DELETE ON `productos_salida`
 FOR EACH ROW BEGIN
DECLARE  int;
declare  int;
declare  int;
declare  decimal(24,16);

declare  date;
declare  int;
declare  int;
declare  varchar(7);
declare  int;
declare  int;
declare  int;
declare  int;
declare  decimal(24,16);

set  = old.id_almacen;
set  = old.id_salida;
set  = old.id_producto;
set  = old.cantidad;



select s.fecha, s.id_tido, s.serie, s.numero, s.id_usuarios, s.estado 
into , , , , ,   
from salida  as s 
where s.id_salida =  and s.id_almacen = ;


update productos_almacen 
set cactual = cactual +  
where id_almacen =  and id_producto = ;

update productos 
set productos.ctotal = ctotal +  
where productos.id_producto = ;

select pa.cactual
into 
from productos_almacen pa
where pa.id_almacen =  and pa.id_producto = ;

select ifnull(max(id_kardex) + 1, 1) 
into  
from kardex_productos 
where id_producto =  and id_almacen = ;

insert into kardex_productos 
values (, , , , 17, , 0, 0, 0, , , , , CURRENT_TIMESTAMP(), );

END

CREATE TRIGGER `tu_productos_traslados` BEFORE UPDATE ON `productos_traslados`
 FOR EACH ROW begin
declare  int;
declare  date;
declare  int;

declare  int;
declare  int;

declare  int;
declare  decimal(10,3);
declare  decimal(10,3);
declare  decimal(10,3);
declare  decimal(24,16);
declare  float;
declare  int;

declare  int;

set  = old.id_traslado;
set  = old.id_producto;
set  = old.c_enviado;
set  = new.c_recibido;
set  =  - ;
set  = 0;

if ( > 0) then
select t.fecha, t.a_destino, t.a_origen, t.u_recibe 
into , , , 
from traslados as t 
where t.id_traslado = ;


select count(*) 
into  
from productos_almacen 
where id_producto =  and id_almacen = ;


if ( > 0) then
    update productos_almacen
    set cactual = cactual + , f_infreso =  
    where id_almacen =  and id_producto = ;

   /* crear el kardex del almacen llegada*/
   select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 11, , 0, , 0,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );
    
    
   
   
   /*fin de kardex*/





else 
	insert into productos_almacen 
    values (, , , , "1000-01-01");
	  /* crear el kardex del almacen llegada cuando es nuevo*/
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 11, , 0, , 0,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );

   /*fin de kardex*/
	
	
end if;


select p.costo 
into  
from productos as p 
where p.id_producto = ;


if ( > 0) then
	update productos_almacen
    set cactual = cactual +  
    where id_almacen =  and id_producto = ;
   /* crear kardex cuando hay devolucion*/ 
    select pa.cactual
	into 
	from productos_almacen pa
	where pa.id_almacen =  and pa.id_producto = ;

  
	select ifnull(max(id_kardex) + 1, 1) 
	into  
	from kardex_productos 
	where id_producto =  and id_almacen = ;
    
SET time_zone='America/Lima';
	insert into kardex_productos 
	values (, , , , 19, , 0, , 0,  8, 'NT'+, , , CURRENT_TIMESTAMP(3), );
     /* fin de creacion de kardex*/ 
    update traslados 
    set estado = 4 
    where id_traslado = ;
end if;
end if;
end

CREATE TRIGGER `tu_ventas` AFTER UPDATE ON `ventas`
 FOR EACH ROW BEGIN
declare  int;
declare  double;
declare  date;
declare  int;
declare  int;

declare  int;
declare  int;

set  = old.id_cliente;
set  = old.total;
set  = old.fecha;
set  = old.tipo_venta;

set  = old.id_tido;
set  = old.id_almacen;
set  = new.estado;

if ( = 3) then
    update clientes 
    set venta = venta -   
    where id_cliente = ;
end if;

END
