DELIMITER //
drop procedure if exists get_preparation_nutrients;
create procedure get_preparation_nutrients(companyId int, preparationId int)
begin
	select * from v_preparation_nutrients
	where company_id=companyId
	and preparation_id=preparationId;
end //
DELIMITER ;
-- call get_preparation_nutrients(1, 4464);
-- --------------------------------------------------------------------------------

DELIMITER //
drop procedure if exists get_preparation_nutrients;
create procedure list_programming_nutrients(
companyId int, dateFrom date, dateTo date, regimeId int, foodTypeId int)
begin
	select * from v_programming_nutrients
	where company_id=companyId
	and date >= dateFrom
	and date <= dateTo
	and regime_id = regimeId
	and food_type_id = foodTypeId;
end //
DELIMITER ;
-- call list_programming_nutrients(1, '2020-11-21', '2020-11-21', 1014, 10);
-- --------------------------------------------------------------------------------

DELIMITER //
drop procedure if exists get_detailed_orders;
create procedure get_detailed_orders(
companyId int, dateFrom date, dateTo date, regimeId int, foodTypeId int )
begin
	if(regimeId=0 && foodTypeId=0) then
		select food_type_id, food_type_descrip, food_descrip, unit_type, sum(amount_sta*portions) amount,
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		group by food_type_id, food_type_descrip, unit_type, food_descrip;
	end if;
	
	if(regimeId<>0 && foodTypeId=0) then
		select food_type_id, food_type_descrip, food_descrip, unit_type, sum(amount_sta*portions) amount,
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		and regime_id=regimeId
		group by food_type_id, food_type_descrip, unit_type, food_descrip;
	end if;
	
	if(regimeId=0 && foodTypeId<>0) then
		select food_type_id, food_type_descrip, food_descrip, unit_type, sum(amount_sta*portions) amount,
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		and food_type_id=foodTypeId
		group by food_type_id, food_type_descrip, unit_type, food_descrip;
	end if;
	
	if(regimeId<>0 && foodTypeId<>0) then
		select food_type_id, food_type_descrip, food_descrip, unit_type, sum(amount_sta*portions) amount,
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		and regime_id=regimeId
		and food_type_id=foodTypeId
		group by food_type_id, food_type_descrip, unit_type, food_descrip;
	end if;
			
end //
DELIMITER ;
-- call get_detailed_orders(1, '2020-11-23', '2020-11-23', 1013, 9);
-- ------------------------------------------------------------------------

select * from v_programming_details
select * from regimes

DELIMITER //
drop procedure if exists get_consolided_orders;
create procedure get_consolided_orders(
companyId int, dateFrom date, dateTo date, regimeId int, foodTypeId int )
begin
	if(regimeId=0 && foodTypeId=0) then
		select unit_type, food_id, food_descrip,  sum(amount_sta*portions) amount,
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		group by unit_type, food_id, food_descrip;
	end if;
	
	if(regimeId<>0 && foodTypeId=0) then
		select unit_type, food_id, food_descrip,  sum(amount_sta*portions) amount,
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		and regime_id=regimeId
		group by unit_type, food_id, food_descrip;
	end if;
	
	if(regimeId=0 && foodTypeId<>0) then
		select unit_type, food_id, food_descrip,  sum(amount_sta*portions) amount,
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		and food_type_id=foodTypeId
		group by unit_type, food_id, food_descrip;
	end if;
	
	if(regimeId<>0 && foodTypeId<>0) then
		select unit_type, food_id, food_descrip,  sum(amount_sta*portions) amount,
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		and regime_id=regimeId
		and food_type_id=foodTypeId
		group by unit_type, food_id, food_descrip;
	end if;
	
end //
DELIMITER ;
-- call get_consolided_orders(1, '2020-11-23', '2020-11-23', 1013, 9);
-- ------------------------------------------------------------------------

DELIMITER //
drop procedure if exists get_stocked_consolided_orders;
create procedure get_stocked_consolided_orders(
companyId int, dateFrom date, dateTo date, regimeId int, foodTypeId int )
begin

	if(regimeId=0 && foodTypeId=0) then
		select food_id, food_descrip, sum(amount_sta*portions) amount,
		get_item_stock(companyId,food_id) as stock, 
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		group by unit_type, food_id, food_descrip;
	end if;
	
	if(regimeId<>0 && foodTypeId=0) then
		select food_id, food_descrip, sum(amount_sta*portions) amount,
		get_item_stock(companyId,food_id) as stock, 
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		and regime_id=regimeId
		group by unit_type, food_id, food_descrip;
	end if;
	
	if(regimeId=0 && foodTypeId<>0) then
		select food_id, food_descrip, sum(amount_sta*portions) amount,
		get_item_stock(companyId,food_id) as stock, 
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		and food_type_id=foodTypeId
		group by unit_type, food_id, food_descrip;
	end if;
	
	if(regimeId<>0 && foodTypeId<>0) then
		select food_id, food_descrip, sum(amount_sta*portions) amount,
		get_item_stock(companyId,food_id) as stock, 
		unit_type_symbol(unit_type, 1) as type_symbol
		from v_programming_details
		where company_id=companyId
		and date>= dateFrom
		and date<=dateTo
		and regime_id=regimeId
		and food_type_id=foodTypeId
		group by unit_type, food_id, food_descrip;
	end if;
	
end //
DELIMITER ;
-- call get_stocked_consolided_orders(1, '2020-11-23', '2020-11-23', 1013, 9);
-- ------------------------------------------------------------------------