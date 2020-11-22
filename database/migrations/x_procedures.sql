DELIMITER //
create or replace procedure list_programming_nutrients(
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
call list_programming_nutrients(1, '2020-11-21', '2020-11-21', 1014, 10)

----------------------------------------------------------------------------------
DELIMITER //
create or replace procedure list_preparation_nutrients(
companyId int, preparationId int)
begin
	select * from v_preparation_nutrients
	where company_id=companyId
	and preparation_id = preparationId;
end //
DELIMITER ;

call list_preparation_nutrients(1, 3381)
-------------------------------------------------------------------------------------
DELIMITER //
drop procedure if exists get_detailed_orders;
create procedure get_detailed_orders(
companyId int, dateFrom date, dateTo date, regimeId int, foodTypeId int )
begin

	set @myquery = CONCAT('select food_type_id, food_type_descrip, food_id, food_descrip, sum(amount_sta) amount, "kg" as unit_symbol from v_programmings',
		CONCAT(' where company_id=', companyId),
		CONCAT(' and date>=\'', dateFrom, '\''),
		CONCAT(' and date<=\'', dateTo, '\''),
		if(regimeId<>0, CONCAT(' and regime_id=', regimeId),''),
		if(foodTypeId<>0, CONCAT(' and food_type_id=', foodTypeId),''),
		'group by food_type_id, food_type_descrip, food_id, food_descrip'
	);
			
	prepare stmt from @myquery;
	execute stmt;
	deallocate prepare stmt;
end //
DELIMITER ;
-- call get_detailed_orders(2, '2020-11-16', '2020-11-18', 0, 0)
--------------------------------------------------------------------------
