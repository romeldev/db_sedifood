drop function if exists three_rule;
create function three_rule(nut_grams decimal(9,3), nut_value decimal(9,3), food_amount decimal(9,3) )
returns decimal(9,3)
begin
    declare result decimal(9,3) default 0;
    set result = if(nut_grams=0 or nut_grams is null, 0, (nut_value*food_amount/nut_grams) );
    return result;
end
-------------------------------------------------------------------------

drop function if exists get_item_stock;
create function get_item_stock( companyId int, foodId int)
returns decimal(16,6)
begin
	declare stock decimal(16,6) default 0;
	select sum((pa.cactual * p.factor_conversion)) into stock
	from productos_almacen as pa
	inner join productos as p on p.id_producto = pa.id_producto
	inner join insumo as i on i.id_insumo = p.id_insumo
	inner join unidades as u on u.id_unidades= i.id_unidades
	where pa.id_almacen=companyId
	and p.id_insumo=foodId
	group by i.id_insumo;

	return stock;
end;
-- select get_item_stock(2, 0)
-------------------------------------------------------------------------

