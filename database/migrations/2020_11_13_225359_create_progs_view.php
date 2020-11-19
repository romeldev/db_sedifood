<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProgsView extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("drop function if exists three_rule;
        create function three_rule(nut_grams decimal(9,3), nut_value decimal(9,3), food_amount decimal(9,3) )
        returns decimal(9,3)
        begin
            declare result decimal(9,3) default 0;
            set result = if(nut_grams=0 or nut_grams is null, 0, (nut_value*food_amount/nut_grams) );
            return result;
        end");

        DB::statement("create or replace view view_progs as
        select
        pro.company_id, pro.date, regime_id,
        prof.id professional_id, prof.fullname as professional_fullname, 
        prof.profession as professional_profession, prof.code as professional_code,
        reg.id as regimen_id, reg.descrip as regime_descrip,
        foty.id as food_type_id, foty.descrip as food_type_descrip,
        pre.id as preparation_id, pre.descrip as preparation_descrip,
        pred.unit_id,
        foo.id as food_id, foo.descrip as food_descrip,
        pred.amount
        from  programming_details as prod
        left join preparation_details as pred on prod.preparation_id = pred.preparation_id
        left join programmings as pro on pro.id = prod.programming_id
        left join preparations as pre on pre.id = pred.preparation_id
        left join foods as foo on foo.id = pred.food_id
        left join food_types as foty on foty.id = pro.food_type_id
        left join regimes as reg on reg.id = pro.regime_id
        left join professionals as prof on prof.id = pro.professional_id");

        
        DB::statement("create or replace view view_preps as
        select
        pre.id, pre.company_id, preparation_type_id,
        pred.amount*fun.factor as amount,
        pre.id preparation_id, pre.descrip as preparation_descrip,
        foo.id as food_id, foo.descrip as food_descrip
        from preparation_details as pred
        left join preparations as pre on pre.id = pred.preparation_id
        left join foods as foo on foo.id = pred.food_id
        left join nutrients as nut on nut.food_id = foo.id
        left join food_units as fun on fun.food_id = pred.food_id and fun.unit_id = pred.unit_id");


        DB::statement("create or replace view view_nutrients as
        select
        vpro.*,
        (select three_rule(nut.grams, nut.energy_kcal, vpro.amount)) as energy_kcal,
        (select three_rule(nut.grams, nut.water_g, vpro.amount)) as water_g,
        (select three_rule(nut.grams, nut.proteinins_g, vpro.amount)) as proteinins_g,
        (select three_rule(nut.grams, nut.total_fat_g, vpro.amount)) as total_fat_g,
        (select three_rule(nut.grams, nut.total_carbohydrates_g, vpro.amount)) as total_carbohydrates_g,
        (select three_rule(nut.grams, nut.disp_carbohydrates_g, vpro.amount)) as disp_carbohydrates_g,
        (select three_rule(nut.grams, nut.raw_fiber_g, vpro.amount)) as raw_fiber_g,
        (select three_rule(nut.grams, nut.dietary_fiber_g, vpro.amount)) as dietary_fiber_g,
        (select three_rule(nut.grams, nut.calcium_mg, vpro.amount)) as calcium_mg,
        (select three_rule(nut.grams, nut.match_mg, vpro.amount)) as match_mg,
        (select three_rule(nut.grams, nut.zinc_mg, vpro.amount)) as zinc_mg,
        (select three_rule(nut.grams, nut.iron_mg, vpro.amount)) as iron_mg,
        (select three_rule(nut.grams, nut.carotene_ug, vpro.amount)) as carotene_ug,
        (select three_rule(nut.grams, nut.retinol_ug, vpro.amount)) as retinol_ug,
        (select three_rule(nut.grams, nut.vitamin_a_ug, vpro.amount)) as vitamin_a_ug,
        (select three_rule(nut.grams, nut.thiamine_mg, vpro.amount)) as thiamine_mg,
        (select three_rule(nut.grams, nut.reboflavin_mg, vpro.amount)) as reboflavin_mg,
        (select three_rule(nut.grams, nut.niacin_mg, vpro.amount)) as niacin_mg,
        (select three_rule(nut.grams, nut.vitamin_c_mg, vpro.amount)) as vitamin_c_mg,
        (select three_rule(nut.grams, nut.asct_g, vpro.amount)) as asct_g,
        (select three_rule(nut.grams, nut.sodium_mg, vpro.amount)) as sodium_mg,
        (select three_rule(nut.grams, nut.cholesterol_mg, vpro.amount)) as cholesterol_mg,
        (select three_rule(nut.grams, nut.potassium_mg, vpro.amount)) as potassium_mg,
        (select three_rule(nut.grams, nut.omega3, vpro.amount)) as omega3,
        (select three_rule(nut.grams, nut.omega6, vpro.amount)) as omega6,
        (select three_rule(nut.grams, nut.saturated_fat_g, vpro.amount)) as saturated_fat_g,
        (select three_rule(nut.grams, nut.trans_fat_g, vpro.amount)) as trans_fat_g,
        (select three_rule(nut.grams, nut.magnetium_mg, vpro.amount)) as magnetium_mg,
        (select three_rule(nut.grams, nut.iodine_mg, vpro.amount)) as iodine_mg,
        (select three_rule(nut.grams, nut.selenium_ug, vpro.amount)) as selenium_ug,
        (select three_rule(nut.grams, nut.folic_acid_ug, vpro.amount)) as folic_acid_ug,
        (select three_rule(nut.grams, nut.vitamin_d_ug, vpro.amount)) as vitamin_d_ug,
        (select three_rule(nut.grams, nut.vitamin_b1_mg, vpro.amount)) as vitamin_b1_mg,
        (select three_rule(nut.grams, nut.vitamin_b2_mg, vpro.amount)) as vitamin_b2_mg,
        (select three_rule(nut.grams, nut.b12_vitamin_mg, vpro.amount)) as b12_vitamin_mg,
        (select three_rule(nut.grams, nut.copper_ug, vpro.amount)) as copper_ug,
        (select three_rule(nut.grams, nut.mercury_ug, vpro.amount)) as mercury_ug,
        (select three_rule(nut.grams, nut.lead_ug, vpro.amount)) as lead_ug,
        (select three_rule(nut.grams, nut.aluminum_mg, vpro.amount)) as aluminum_mg,
        (select three_rule(nut.grams, nut.cadmium_ug, vpro.amount)) as cadmium_ug,
        (select three_rule(nut.grams, nut.arsenic_ug, vpro.amount)) as arsenic_ug,
        (select three_rule(nut.grams, nut.dha_mg, vpro.amount)) as dha_mg,
        (select three_rule(nut.grams, nut.ara_mg, vpro.amount)) as ara_mg
        from view_progs as vpro
        left join nutrients as nut on nut.food_id = vpro.food_id");

        DB::statement("create or replace view view_prep_nutrients as
        select
        vpro.*,
        (select three_rule(nut.grams, nut.energy_kcal, vpro.amount)) AS energy_kcal,
        (select three_rule(nut.grams, nut.water_g, vpro.amount)) AS water_g,
        (select three_rule(nut.grams, nut.proteinins_g, vpro.amount)) AS proteinins_g,
        (select three_rule(nut.grams, nut.total_fat_g, vpro.amount)) AS total_fat_g,
        (select three_rule(nut.grams, nut.total_carbohydrates_g, vpro.amount)) AS total_carbohydrates_g,
        (select three_rule(nut.grams, nut.disp_carbohydrates_g, vpro.amount)) AS disp_carbohydrates_g,
        (select three_rule(nut.grams, nut.raw_fiber_g, vpro.amount)) AS raw_fiber_g,
        (select three_rule(nut.grams, nut.dietary_fiber_g, vpro.amount)) AS dietary_fiber_g,
        (select three_rule(nut.grams, nut.calcium_mg, vpro.amount)) AS calcium_mg,
        (select three_rule(nut.grams, nut.match_mg, vpro.amount)) AS match_mg,
        (select three_rule(nut.grams, nut.zinc_mg, vpro.amount)) AS zinc_mg,
        (select three_rule(nut.grams, nut.iron_mg, vpro.amount)) AS iron_mg,
        (select three_rule(nut.grams, nut.carotene_ug, vpro.amount)) AS carotene_ug,
        (select three_rule(nut.grams, nut.retinol_ug, vpro.amount)) AS retinol_ug,
        (select three_rule(nut.grams, nut.vitamin_a_ug, vpro.amount)) AS vitamin_a_ug,
        (select three_rule(nut.grams, nut.thiamine_mg, vpro.amount)) AS thiamine_mg,
        (select three_rule(nut.grams, nut.reboflavin_mg, vpro.amount)) AS reboflavin_mg,
        (select three_rule(nut.grams, nut.niacin_mg, vpro.amount)) AS niacin_mg,
        (select three_rule(nut.grams, nut.vitamin_c_mg, vpro.amount)) AS vitamin_c_mg,
        (select three_rule(nut.grams, nut.asct_g, vpro.amount)) AS asct_g,
        (select three_rule(nut.grams, nut.sodium_mg, vpro.amount)) AS sodium_mg,
        (select three_rule(nut.grams, nut.cholesterol_mg, vpro.amount)) AS cholesterol_mg,
        (select three_rule(nut.grams, nut.potassium_mg, vpro.amount)) AS potassium_mg,
        (select three_rule(nut.grams, nut.omega3, vpro.amount)) AS omega3,
        (select three_rule(nut.grams, nut.omega6, vpro.amount)) AS omega6,
        (select three_rule(nut.grams, nut.saturated_fat_g, vpro.amount)) AS saturated_fat_g,
        (select three_rule(nut.grams, nut.trans_fat_g, vpro.amount)) AS trans_fat_g,
        (select three_rule(nut.grams, nut.magnetium_mg, vpro.amount)) AS magnetium_mg,
        (select three_rule(nut.grams, nut.iodine_mg, vpro.amount)) AS iodine_mg,
        (select three_rule(nut.grams, nut.selenium_ug, vpro.amount)) AS selenium_ug,
        (select three_rule(nut.grams, nut.folic_acid_ug, vpro.amount)) AS folic_acid_ug,
        (select three_rule(nut.grams, nut.vitamin_d_ug, vpro.amount)) AS vitamin_d_ug,
        (select three_rule(nut.grams, nut.vitamin_b1_mg, vpro.amount)) AS vitamin_b1_mg,
        (select three_rule(nut.grams, nut.vitamin_b2_mg, vpro.amount)) AS vitamin_b2_mg,
        (select three_rule(nut.grams, nut.b12_vitamin_mg, vpro.amount)) AS b12_vitamin_mg,
        (select three_rule(nut.grams, nut.copper_ug, vpro.amount)) AS copper_ug,
        (select three_rule(nut.grams, nut.mercury_ug, vpro.amount)) AS mercury_ug,
        (select three_rule(nut.grams, nut.lead_ug, vpro.amount)) AS lead_ug,
        (select three_rule(nut.grams, nut.aluminum_mg, vpro.amount)) AS aluminum_mg,
        (select three_rule(nut.grams, nut.cadmium_ug, vpro.amount)) AS cadmium_ug,
        (select three_rule(nut.grams, nut.arsenic_ug, vpro.amount)) AS arsenic_ug,
        (select three_rule(nut.grams, nut.dha_mg, vpro.amount)) AS dha_mg,
        (select three_rule(nut.grams, nut.ara_mg, vpro.amount)) AS ara_mg
        from view_preps AS vpro
        left join nutrients as nut on nut.food_id = vpro.food_id");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //DB::statement('drop view if exists view_progs');
    }
}
