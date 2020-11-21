

-- select * from view_preps
create or replace view view_preps as
select
pre.id, pre.company_id, preparation_type_id,
pre.id preparation_id, pre.descrip as preparation_descrip,
foo.id as food_id, foo.descrip as food_descrip,
pred.amount amount, pred.unit_id,
uni.type as unit_type, 
unit_convert_to_min(pred.amount, pred.unit_id) as amount_min,
if(uni.type=2, 'g', if(uni.type=3,'ml', 'u')) as unit_abrev_min
from preparation_details as pred
left join preparations as pre on pre.id = pred.preparation_id
left join foods as foo on foo.id = pred.food_id
left join nutrients as nut on nut.food_id = foo.id
left join units as uni on uni.id = pred.unit_id


drop function if exists three_rule;
create function three_rule(nut_grams decimal(9,3), nut_value decimal(9,3), food_amount decimal(9,3) )
returns decimal(9,3)
begin
    declare result decimal(9,3) default 0;
    set result = if(nut_grams=0 or nut_grams is null, 0, (nut_value*food_amount/nut_grams) );
    return result;
end