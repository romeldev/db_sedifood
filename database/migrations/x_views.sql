-- select * from companies
drop view if exists companies;
create view companies as
select id_almacen as id, nombre as descrip, IF(estado=1, NULL, 0) as deleted_at from almacen;
-- ------------------------------------------------------------------------------------------------------------

-- select * from foods
drop view if exists foods;
create view foods as
select id_insumo as id, nombre as descrip, 1 as food_group_id, if(estado=1,null, 0) as deleted_at from insumo;
-- ------------------------------------------------------------------------------------------------------------

-- select * from v_programming_details
drop view if exists v_programming_details;
create view v_programming_details as
select
pro.company_id, pro.date,
prof.id professional_id, prof.fullname as professional_fullname, 
prof.profession as professional_profession, prof.code as professional_code,
reg.id as regime_id, reg.descrip as regime_descrip,
foty.id as food_type_id, foty.descrip as food_type_descrip,
pre.id as preparation_id, pre.descrip as preparation_descrip,
foo.id as food_id, foo.descrip as food_descrip,
prod.portions, pred.amount, pred.unit_id,
pred.unit_type,
pred.amount_m as amount_min,
unit_type_symbol(pred.unit_type, 0) as unit_abrev_min,
pred.amount_s as amount_sta,
unit_type_symbol(pred.unit_type, 1) as unit_abrev_sta
from  programming_details as prod
left join preparation_details as pred on pred.preparation_id = prod.preparation_id and pred.deleted_at is null
left join programmings as pro on pro.id = prod.programming_id
left join preparations as pre on pre.id = pred.preparation_id
left join foods as foo on foo.id = pred.food_id
left join food_types as foty on foty.id = pro.food_type_id
left join regimes as reg on reg.id = pro.regime_id
left join professionals as prof on prof.id = pro.professional_id
where prod.deleted_at is null;
-- ------------------------------------------------------------------------------------------------------------

-- select * from v_preparation_details
drop view if exists v_preparation_details;
create view v_preparation_details as
select
pre.id, pre.company_id, preparation_type_id,
pre.id preparation_id, pre.descrip as preparation_descrip,
foo.id as food_id, foo.descrip as food_descrip,
pred.amount amount, pred.unit_id,
uni.type as unit_type, uni.abrev as unit_abrev,
pred.amount_m as amount_min,
unit_type_symbol(pred.unit_type, 0) as unit_abrev_min
from preparation_details as pred
left join preparations as pre on pre.id = pred.preparation_id
left join foods as foo on foo.id = pred.food_id
left join nutrients as nut on nut.food_id = foo.id
left join units as uni on uni.id = pred.unit_id
where pred.deleted_at is null;
-- ------------------------------------------------------------------------------------------------------------

-- select * from v_preparation_nutrients
drop view if exists v_preparation_nutrients;
create view v_preparation_nutrients as
select
vpre.*,
(select three_rule(nut.grams, nut.energy_kcal, vpre.amount_min)) AS energy_kcal,
(select three_rule(nut.grams, nut.water_g, vpre.amount_min)) AS water_g,
(select three_rule(nut.grams, nut.proteinins_g, vpre.amount_min)) AS proteinins_g,
(select three_rule(nut.grams, nut.total_fat_g, vpre.amount_min)) AS total_fat_g,
(select three_rule(nut.grams, nut.total_carbohydrates_g, vpre.amount_min)) AS total_carbohydrates_g,
(select three_rule(nut.grams, nut.disp_carbohydrates_g, vpre.amount_min)) AS disp_carbohydrates_g,
(select three_rule(nut.grams, nut.raw_fiber_g, vpre.amount_min)) AS raw_fiber_g,
(select three_rule(nut.grams, nut.dietary_fiber_g, vpre.amount_min)) AS dietary_fiber_g,
(select three_rule(nut.grams, nut.calcium_mg, vpre.amount_min)) AS calcium_mg,
(select three_rule(nut.grams, nut.match_mg, vpre.amount_min)) AS match_mg,
(select three_rule(nut.grams, nut.zinc_mg, vpre.amount_min)) AS zinc_mg,
(select three_rule(nut.grams, nut.iron_mg, vpre.amount_min)) AS iron_mg,
(select three_rule(nut.grams, nut.carotene_ug, vpre.amount_min)) AS carotene_ug,
(select three_rule(nut.grams, nut.retinol_ug, vpre.amount_min)) AS retinol_ug,
(select three_rule(nut.grams, nut.vitamin_a_ug, vpre.amount_min)) AS vitamin_a_ug,
(select three_rule(nut.grams, nut.thiamine_mg, vpre.amount_min)) AS thiamine_mg,
(select three_rule(nut.grams, nut.reboflavin_mg, vpre.amount_min)) AS reboflavin_mg,
(select three_rule(nut.grams, nut.niacin_mg, vpre.amount_min)) AS niacin_mg,
(select three_rule(nut.grams, nut.vitamin_c_mg, vpre.amount_min)) AS vitamin_c_mg,
(select three_rule(nut.grams, nut.asct_g, vpre.amount_min)) AS asct_g,
(select three_rule(nut.grams, nut.sodium_mg, vpre.amount_min)) AS sodium_mg,
(select three_rule(nut.grams, nut.cholesterol_mg, vpre.amount_min)) AS cholesterol_mg,
(select three_rule(nut.grams, nut.potassium_mg, vpre.amount_min)) AS potassium_mg,
(select three_rule(nut.grams, nut.omega3, vpre.amount_min)) AS omega3,
(select three_rule(nut.grams, nut.omega6, vpre.amount_min)) AS omega6,
(select three_rule(nut.grams, nut.saturated_fat_g, vpre.amount_min)) AS saturated_fat_g,
(select three_rule(nut.grams, nut.trans_fat_g, vpre.amount_min)) AS trans_fat_g,
(select three_rule(nut.grams, nut.magnetium_mg, vpre.amount_min)) AS magnetium_mg,
(select three_rule(nut.grams, nut.iodine_mg, vpre.amount_min)) AS iodine_mg,
(select three_rule(nut.grams, nut.selenium_ug, vpre.amount_min)) AS selenium_ug,
(select three_rule(nut.grams, nut.folic_acid_ug, vpre.amount_min)) AS folic_acid_ug,
(select three_rule(nut.grams, nut.vitamin_d_ug, vpre.amount_min)) AS vitamin_d_ug,
(select three_rule(nut.grams, nut.vitamin_b1_mg, vpre.amount_min)) AS vitamin_b1_mg,
(select three_rule(nut.grams, nut.vitamin_b2_mg, vpre.amount_min)) AS vitamin_b2_mg,
(select three_rule(nut.grams, nut.b12_vitamin_mg, vpre.amount_min)) AS b12_vitamin_mg,
(select three_rule(nut.grams, nut.copper_ug, vpre.amount_min)) AS copper_ug,
(select three_rule(nut.grams, nut.mercury_ug, vpre.amount_min)) AS mercury_ug,
(select three_rule(nut.grams, nut.lead_ug, vpre.amount_min)) AS lead_ug,
(select three_rule(nut.grams, nut.aluminum_mg, vpre.amount_min)) AS aluminum_mg,
(select three_rule(nut.grams, nut.cadmium_ug, vpre.amount_min)) AS cadmium_ug,
(select three_rule(nut.grams, nut.arsenic_ug, vpre.amount_min)) AS arsenic_ug,
(select three_rule(nut.grams, nut.dha_mg, vpre.amount_min)) AS dha_mg,
(select three_rule(nut.grams, nut.ara_mg, vpre.amount_min)) AS ara_mg
from v_preparation_details AS vpre
left join nutrients as nut on nut.food_id = vpre.food_id;
-- ------------------------------------------------------------------------------------------------------------

-- select * from v_programming_nutrients
create or replace view v_programming_nutrients as
select
vpro.*,
(select three_rule(nut.grams, nut.energy_kcal, vpro.amount_min)) AS energy_kcal,
(select three_rule(nut.grams, nut.water_g, vpro.amount_min)) AS water_g,
(select three_rule(nut.grams, nut.proteinins_g, vpro.amount_min)) AS proteinins_g,
(select three_rule(nut.grams, nut.total_fat_g, vpro.amount_min)) AS total_fat_g,
(select three_rule(nut.grams, nut.total_carbohydrates_g, vpro.amount_min)) AS total_carbohydrates_g,
(select three_rule(nut.grams, nut.disp_carbohydrates_g, vpro.amount_min)) AS disp_carbohydrates_g,
(select three_rule(nut.grams, nut.raw_fiber_g, vpro.amount_min)) AS raw_fiber_g,
(select three_rule(nut.grams, nut.dietary_fiber_g, vpro.amount_min)) AS dietary_fiber_g,
(select three_rule(nut.grams, nut.calcium_mg, vpro.amount_min)) AS calcium_mg,
(select three_rule(nut.grams, nut.match_mg, vpro.amount_min)) AS match_mg,
(select three_rule(nut.grams, nut.zinc_mg, vpro.amount_min)) AS zinc_mg,
(select three_rule(nut.grams, nut.iron_mg, vpro.amount_min)) AS iron_mg,
(select three_rule(nut.grams, nut.carotene_ug, vpro.amount_min)) AS carotene_ug,
(select three_rule(nut.grams, nut.retinol_ug, vpro.amount_min)) AS retinol_ug,
(select three_rule(nut.grams, nut.vitamin_a_ug, vpro.amount_min)) AS vitamin_a_ug,
(select three_rule(nut.grams, nut.thiamine_mg, vpro.amount_min)) AS thiamine_mg,
(select three_rule(nut.grams, nut.reboflavin_mg, vpro.amount_min)) AS reboflavin_mg,
(select three_rule(nut.grams, nut.niacin_mg, vpro.amount_min)) AS niacin_mg,
(select three_rule(nut.grams, nut.vitamin_c_mg, vpro.amount_min)) AS vitamin_c_mg,
(select three_rule(nut.grams, nut.asct_g, vpro.amount_min)) AS asct_g,
(select three_rule(nut.grams, nut.sodium_mg, vpro.amount_min)) AS sodium_mg,
(select three_rule(nut.grams, nut.cholesterol_mg, vpro.amount_min)) AS cholesterol_mg,
(select three_rule(nut.grams, nut.potassium_mg, vpro.amount_min)) AS potassium_mg,
(select three_rule(nut.grams, nut.omega3, vpro.amount_min)) AS omega3,
(select three_rule(nut.grams, nut.omega6, vpro.amount_min)) AS omega6,
(select three_rule(nut.grams, nut.saturated_fat_g, vpro.amount_min)) AS saturated_fat_g,
(select three_rule(nut.grams, nut.trans_fat_g, vpro.amount_min)) AS trans_fat_g,
(select three_rule(nut.grams, nut.magnetium_mg, vpro.amount_min)) AS magnetium_mg,
(select three_rule(nut.grams, nut.iodine_mg, vpro.amount_min)) AS iodine_mg,
(select three_rule(nut.grams, nut.selenium_ug, vpro.amount_min)) AS selenium_ug,
(select three_rule(nut.grams, nut.folic_acid_ug, vpro.amount_min)) AS folic_acid_ug,
(select three_rule(nut.grams, nut.vitamin_d_ug, vpro.amount_min)) AS vitamin_d_ug,
(select three_rule(nut.grams, nut.vitamin_b1_mg, vpro.amount_min)) AS vitamin_b1_mg,
(select three_rule(nut.grams, nut.vitamin_b2_mg, vpro.amount_min)) AS vitamin_b2_mg,
(select three_rule(nut.grams, nut.b12_vitamin_mg, vpro.amount_min)) AS b12_vitamin_mg,
(select three_rule(nut.grams, nut.copper_ug, vpro.amount_min)) AS copper_ug,
(select three_rule(nut.grams, nut.mercury_ug, vpro.amount_min)) AS mercury_ug,
(select three_rule(nut.grams, nut.lead_ug, vpro.amount_min)) AS lead_ug,
(select three_rule(nut.grams, nut.aluminum_mg, vpro.amount_min)) AS aluminum_mg,
(select three_rule(nut.grams, nut.cadmium_ug, vpro.amount_min)) AS cadmium_ug,
(select three_rule(nut.grams, nut.arsenic_ug, vpro.amount_min)) AS arsenic_ug,
(select three_rule(nut.grams, nut.dha_mg, vpro.amount_min)) AS dha_mg,
(select three_rule(nut.grams, nut.ara_mg, vpro.amount_min)) AS ara_mg
 from v_programming_details as vpro
 left join nutrients as nut on nut.food_id = vpro.food_id;
-- ------------------------------------------------------------------------------------------------------------