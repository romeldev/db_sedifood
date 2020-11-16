<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Food extends Model
{
    public $table = "foods";

    public $timestamps = false;
    
    protected $fillable = [
        'id',
        'descrip',
        'net_weight',
        'grams',
        'food_type_id',
        'energy_kcal',
        'water_g',
        'proteinins_g',
        'total_fat_g',
        'total_carbohydrates_g',
        'raw_fiber_g',
        'dietary_fiber_g',
        'calcium_mg',
        'match_mg',
        'zinc_mg',
        'iron_mg',
        'carotene_ug',
        'retinol_ug',
        'vitamin_a_ug',
        'thiamine_mg',
        'reboflavin_mg',
        'niacin_mg',
        'vitamin_c_mg',
        'asct_g',
        'sodium_mg',
        'cholesterol_mg',
        'potassium_mg',
        'omega3',
        'omega6',
        'saturated_fat_g',
        'trans_fat_g',
        'magnetium_mg',
        'iodine_mg',
        'selenium_ug',
        'folic_acid_ug',
        'vitamin_d_ug',
        'vitamin_b1_mg',
        'vitamin_b2_mg',
        'b12_vitamin_mg',
        'copper_ug',
        'mercury_ug',
        'lead_ug',
        'aluminum_mg',
        'cadmium_ug',
        'arsenic_ug',
        'dha_mg',
        'ara_mg',
    ];


    public function factorUnits()
    {
        return $this->hasMany(FactorUnit::class);
    }

}
