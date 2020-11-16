<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Food;
use App\FoodType;
use Faker\Generator as Faker;

$factory->define(Food::class, function (Faker $faker) {

    $data = [
        'descrip' => strtoupper($faker->words(rand(3, 5), true)),
        'food_type_id' => FoodType::inRandomOrder()->first()->id,

        // 'grams' => 100,
        // 'net_weight' => 100,
        // 'energy_kcal' => rand(0, 50),
        // 'water_g' => rand(0, 50),
        // 'proteinins_g' => rand(0, 50),
        // 'total_fat_g' => rand(0, 50),
        // 'total_carbohydrates_g' => rand(0, 50),
        // 'raw_fiber_g' => rand(0, 50),
        // 'dietary_fiber_g' => rand(0, 50),
        // 'calcium_mg' => rand(0, 50),
        // 'match_mg' => rand(0, 50),
        // 'zinc_mg' => rand(0, 50),
        // 'iron_mg' => rand(0, 50),
        // 'carotene_ug' => rand(0, 50),
        // 'retinol_ug' => rand(0, 50),
        // 'vitamin_a_ug' => rand(0, 50),
        // 'thiamine_mg' => rand(0, 50),
        // 'reboflavin_mg' => rand(0, 50),
        // 'niacin_mg' => rand(0, 50),
        // 'vitamin_c_mg' => rand(0, 50),
        // 'asct_g' => rand(0, 50),
        // 'sodium_mg' => rand(0, 50),
        // 'cholesterol_mg' => rand(0, 50),
        // 'potassium_mg' => rand(0, 50),
        // 'omega3' => rand(0, 50),
        // 'omega6' => rand(0, 50),
        // 'saturated_fat_g' => rand(0, 50),
        // 'trans_fat_g' => rand(0, 50),
        // 'magnetium_mg' => rand(0, 50),
        // 'iodine_mg' => rand(0, 50),
        // 'selenium_ug' => rand(0, 50),
        // 'folic_acid_ug' => rand(0, 50),
        // 'vitamin_d_ug' => rand(0, 50),
        // 'vitamin_b1_mg' => rand(0, 50),
        // 'vitamin_b2_mg' => rand(0, 50),
        // 'b12_vitamin_mg' => rand(0, 50),
        // 'copper_ug' => rand(0, 50),
        // 'mercury_ug' => rand(0, 50),
        // 'lead_ug' => rand(0, 50),
        // 'aluminum_mg' => rand(0, 50),
        // 'cadmium_ug' => rand(0, 50),
        // 'arsenic_ug' => rand(0, 50),
        // 'dha_mg' => rand(0, 50),
        // 'ara_mg' => rand(0, 50),
    ];
    return $data;
});
