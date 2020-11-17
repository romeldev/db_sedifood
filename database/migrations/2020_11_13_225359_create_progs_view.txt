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
        DB::statement("CREATE OR REPLACE view view_progs AS
        SELECT
        pro.date, pro.company_id,
        prof.id professional_id, prof.fullname AS professional_fullname, 
        prof.profession AS professional_profession, prof.code AS professional_code,
        rety.id AS regime_id, rety.descrip AS regimen_type_descrip,
        foty.id AS food_type_id, foty.descrip AS food_type_descrip,
        pre.id AS preparation_id, pre.descrip AS preparation_descrip,
        pred.factor_unit_id,
        foo.id AS food_id, foo.descrip AS food_descrip,
        pred.amount
        FROM preparation_details AS pred
        LEFT JOIN programming_details AS prod ON prod.preparation_id = pred.preparation_id
        LEFT JOIN programmings AS pro ON pro.id = prod.programming_id
        LEFT JOIN preparations AS pre ON pre.id = pred.preparation_id
        LEFT JOIN foods AS foo ON foo.id = pred.food_id
        LEFT JOIN food_types AS foty ON foty.id = pro.food_type_id
        LEFT JOIN regimes AS rety ON rety.id = pro.regime_id
        LEFT JOIN professionals AS prof ON prof.id = pro.professional_id
        ");

        

        DB::unprepared("DROP FUNCTION IF EXISTS three_rule;
        CREATE FUNCTION three_rule(nut_grams DECIMAL(9,3), nut_value DECIMAL(9,3), food_amount DECIMAL(9,3) )
        RETURNS DECIMAL(9,3)
        BEGIN
                DECLARE result DECIMAL(9,3) DEFAULT 0.0;
                set result = if(nut_grams=0 or nut_grams is null, 0, (nut_value*food_amount/nut_grams) );
                RETURN result;
        END");

        DB::statement("CREATE OR REPLACE view view_nutrients AS
        SELECT
        vpro.*,
        (SELECT three_rule(nut.grams, nut.energy_kcal, vpro.amount)) AS energy_kcal,
        (SELECT three_rule(nut.grams, nut.water_g, vpro.amount)) AS water_g,
        (SELECT three_rule(nut.grams, nut.proteinins_g, vpro.amount)) AS proteinins_g,
        (SELECT three_rule(nut.grams, nut.total_fat_g, vpro.amount)) AS total_fat_g,
        (SELECT three_rule(nut.grams, nut.total_carbohydrates_g, vpro.amount)) AS total_carbohydrates_g,
        (SELECT three_rule(nut.grams, nut.disp_carbohydrates_g, vpro.amount)) AS disp_carbohydrates_g,
        (SELECT three_rule(nut.grams, nut.raw_fiber_g, vpro.amount)) AS raw_fiber_g,
        (SELECT three_rule(nut.grams, nut.dietary_fiber_g, vpro.amount)) AS dietary_fiber_g,
        (SELECT three_rule(nut.grams, nut.calcium_mg, vpro.amount)) AS calcium_mg,
        (SELECT three_rule(nut.grams, nut.match_mg, vpro.amount)) AS match_mg,
        (SELECT three_rule(nut.grams, nut.zinc_mg, vpro.amount)) AS zinc_mg,
        (SELECT three_rule(nut.grams, nut.iron_mg, vpro.amount)) AS iron_mg,
        (SELECT three_rule(nut.grams, nut.carotene_ug, vpro.amount)) AS carotene_ug,
        (SELECT three_rule(nut.grams, nut.retinol_ug, vpro.amount)) AS retinol_ug,
        (SELECT three_rule(nut.grams, nut.vitamin_a_ug, vpro.amount)) AS vitamin_a_ug,
        (SELECT three_rule(nut.grams, nut.thiamine_mg, vpro.amount)) AS thiamine_mg,
        (SELECT three_rule(nut.grams, nut.reboflavin_mg, vpro.amount)) AS reboflavin_mg,
        (SELECT three_rule(nut.grams, nut.niacin_mg, vpro.amount)) AS niacin_mg,
        (SELECT three_rule(nut.grams, nut.vitamin_c_mg, vpro.amount)) AS vitamin_c_mg,
        (SELECT three_rule(nut.grams, nut.asct_g, vpro.amount)) AS asct_g,
        (SELECT three_rule(nut.grams, nut.sodium_mg, vpro.amount)) AS sodium_mg,
        (SELECT three_rule(nut.grams, nut.cholesterol_mg, vpro.amount)) AS cholesterol_mg,
        (SELECT three_rule(nut.grams, nut.potassium_mg, vpro.amount)) AS potassium_mg,
        (SELECT three_rule(nut.grams, nut.omega3, vpro.amount)) AS omega3,
        (SELECT three_rule(nut.grams, nut.omega6, vpro.amount)) AS omega6,
        (SELECT three_rule(nut.grams, nut.saturated_fat_g, vpro.amount)) AS saturated_fat_g,
        (SELECT three_rule(nut.grams, nut.trans_fat_g, vpro.amount)) AS trans_fat_g,
        (SELECT three_rule(nut.grams, nut.magnetium_mg, vpro.amount)) AS magnetium_mg,
        (SELECT three_rule(nut.grams, nut.iodine_mg, vpro.amount)) AS iodine_mg,
        (SELECT three_rule(nut.grams, nut.selenium_ug, vpro.amount)) AS selenium_ug,
        (SELECT three_rule(nut.grams, nut.folic_acid_ug, vpro.amount)) AS folic_acid_ug,
        (SELECT three_rule(nut.grams, nut.vitamin_d_ug, vpro.amount)) AS vitamin_d_ug,
        (SELECT three_rule(nut.grams, nut.vitamin_b1_mg, vpro.amount)) AS vitamin_b1_mg,
        (SELECT three_rule(nut.grams, nut.vitamin_b2_mg, vpro.amount)) AS vitamin_b2_mg,
        (SELECT three_rule(nut.grams, nut.b12_vitamin_mg, vpro.amount)) AS b12_vitamin_mg,
        (SELECT three_rule(nut.grams, nut.copper_ug, vpro.amount)) AS copper_ug,
        (SELECT three_rule(nut.grams, nut.mercury_ug, vpro.amount)) AS mercury_ug,
        (SELECT three_rule(nut.grams, nut.lead_ug, vpro.amount)) AS lead_ug,
        (SELECT three_rule(nut.grams, nut.aluminum_mg, vpro.amount)) AS aluminum_mg,
        (SELECT three_rule(nut.grams, nut.cadmium_ug, vpro.amount)) AS cadmium_ug,
        (SELECT three_rule(nut.grams, nut.arsenic_ug, vpro.amount)) AS arsenic_ug,
        (SELECT three_rule(nut.grams, nut.dha_mg, vpro.amount)) AS dha_mg,
        (SELECT three_rule(nut.grams, nut.ara_mg, vpro.amount)) AS ara_mg
        FROM view_progs AS vpro
        LEFT JOIN nutrients AS nut ON nut.food_id = vpro.food_id");
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
