drop function if exists three_rule;
create function three_rule(nut_grams decimal(9,3), nut_value decimal(9,3), food_amount decimal(9,3) )
returns decimal(9,3)
begin
    declare result decimal(9,3) default 0;
    set result = if(nut_grams=0 or nut_grams is null, 0, (nut_value*food_amount/nut_grams) );
    return result;
end;
-- -------------------------------------------------------------------------------------------------------

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
-- -------------------------------------------------------------------------------------------------------

drop function if exists unit_type_symbol;
create function unit_type_symbol( unitType int, symbolMin int)
returns varchar(10)
begin
	if symbolMin=0 then
		return if(unitType=1, 'u', if(unitType=2, 'g', if(unitType=3,'ml', 'x')));
	else
		return if(unitType=1, 'u', if(unitType=2, 'kg', if(unitType=3,'l', 'x')));
	end if;
end;
-- -------------------------------------------------------------------------------------------------------

drop function if exists unit_convert_to_min;
create function unit_convert_to_min(current_value decimal(16,6), unit_from_id int)
returns decimal(16,6)
begin
	-- types: 1:unidad, 2:masa, 3:valumen
	declare current_type int default 1;
	declare current_factor decimal(16,6) default 1;

	select if(type=1, 100, factor), type into current_factor, current_type from units where id=unit_from_id;
	return current_value*current_factor;
end;
-- -------------------------------------------------------------------------------------------------------

drop function if exists unit_convert_to_sta;
create function unit_convert_to_sta(current_value decimal(16,6), unit_from_id int)
returns decimal(16,6)
begin
	-- types: 1:unidad, 2:masa, 3:valumen
	declare current_factor decimal(16,6) default 1;
	declare result_factor decimal(16,6) default 1;
	declare unit_to_id int default 0;

	select factor, if(type=2, 4, if(type=3, 5, 1)) into current_factor, unit_to_id from units where id=unit_from_id;
	select factor into result_factor from units where id=unit_to_id;
	return current_value*current_factor/result_factor;
end;
-- -------------------------------------------------------------------------------------------------------

drop function if exists unit_converter;
create function unit_converter(current_value decimal(16,6), unit_from_id int, unit_to_id int)
returns decimal(16,6)
begin
	declare new_value decimal(16,6) default 0;
	declare factor_from decimal(16,6) default 1;
	declare factor_to decimal(16,6) default 1;
	
	select factor into factor_from from units where id=unit_from_id;
	select factor into factor_to from units where id=unit_to_id;
	return current_value*factor_from/factor_to;
end;
-- -------------------------------------------------------------------------------------------------------