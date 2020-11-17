<?php

use Illuminate\Database\Seeder;

class NutrientColumnSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('nutrient_columns')->insert($this->data());
    }

    public function data()
    {
        return [
            [ 'label' => 'Gramos', 'column' => 'grams' ],
            [ 'label' => 'Energia (kcal)', 'column' => 'energy_kcal' ],
            [ 'label' => 'Agua (g)', 'column' => 'water_g' ],
            [ 'label' => 'Proteninas (g)', 'column' => 'proteinins_g' ],
            [ 'label' => 'Grasa Total (g)', 'column' => 'total_fat_g' ],
            [ 'label' => 'Carbohidratos Totales (g)', 'column' => 'total_carbohydrates_g' ],
            [ 'label' => 'Carbohidratos Disp (g)', 'column' => 'disp_carbohydrates_g' ],
            [ 'label' => 'Fibra Cruda (g)', 'column' => 'raw_fiber_g' ],
            [ 'label' => 'Fibra Dietetica (g)', 'column' => 'dietary_fiber_g' ],
            [ 'label' => 'Calcio (mg)', 'column' => 'calcium_mg' ],
            [ 'label' => 'Fosforo (mg)', 'column' => 'match_mg' ],
            [ 'label' => 'Zinc (mg)', 'column' => 'zinc_mg' ],
            [ 'label' => 'Hierro (mg)', 'column' => 'iron_mg' ],
            [ 'label' => 'Carotano (ug)', 'column' => 'carotene_ug' ],
            [ 'label' => 'Retinol (ug)', 'column' => 'retinol_ug' ],
            [ 'label' => 'Vitamina A (ug)', 'column' => 'vitamin_a_ug' ],
            [ 'label' => 'Tiamina (mg)', 'column' => 'thiamine_mg' ],
            [ 'label' => 'Reboflavina (mg)', 'column' => 'reboflavin_mg' ],
            [ 'label' => 'Niacina (mg)', 'column' => 'niacin_mg' ],
            [ 'label' => 'Vitamina C (mg)', 'column' => 'vitamin_c_mg' ],
            [ 'label' => 'Asct (g)', 'column' => 'asct_g' ],
            [ 'label' => 'Sodio (mg)', 'column' => 'sodium_mg' ],
            [ 'label' => 'Colesterol (mg)', 'column' => 'cholesterol_mg' ],
            [ 'label' => 'Potasio (mg)', 'column' => 'potassium_mg' ],
            [ 'label' => 'Omega3', 'column' => 'omega3' ],
            [ 'label' => 'Omega6', 'column' => 'omega6' ],
            [ 'label' => 'Grasa Saturada (g)', 'column' => 'saturated_fat_g' ],
            [ 'label' => 'Grasa Trans (g)', 'column' => 'trans_fat_g' ],
            [ 'label' => 'Magnecio (mg)', 'column' => 'magnetium_mg' ],
            [ 'label' => 'Yodo (mg)', 'column' => 'iodine_mg' ],
            [ 'label' => 'Selenio (ug)', 'column' => 'selenium_ug' ],
            [ 'label' => 'Acido Folico (ug)', 'column' => 'folic_acid_ug' ],
            [ 'label' => 'Vitamina D (ug)', 'column' => 'vitamin_d_ug' ],
            [ 'label' => 'Vitamina B1 (mg)', 'column' => 'vitamin_b1_mg' ],
            [ 'label' => 'Vitamina B2 (mg)', 'column' => 'vitamin_b2_mg' ],
            [ 'label' => 'Vitamina B12 (mg)', 'column' => 'b12_vitamin_mg' ],
            [ 'label' => 'Cobre (ug)', 'column' => 'copper_ug' ],
            [ 'label' => 'Mercurio (ug)', 'column' => 'mercury_ug' ],
            [ 'label' => 'Plomo (ug)', 'column' => 'lead_ug' ],
            [ 'label' => 'Aluminio (mg)', 'column' => 'aluminum_mg' ],
            [ 'label' => 'Cadmio (ug)', 'column' => 'cadmium_ug' ],
            [ 'label' => 'Arsenico (ug)', 'column' => 'arsenic_ug' ],
            [ 'label' => 'Dha (mg)', 'column' => 'dha_mg' ],
            [ 'label' => 'Ara (mg)', 'column' => 'ara_mg' ],
        ];
    }
}
