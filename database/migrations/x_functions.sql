drop function if exists three_rule;
create function three_rule(nut_grams decimal(9,3), nut_value decimal(9,3), food_amount decimal(9,3) )
returns decimal(9,3)
begin
    declare result decimal(9,3) default 0;
    set result = if(nut_grams=0 or nut_grams is null, 0, (nut_value*food_amount/nut_grams) );
    return result;
end
