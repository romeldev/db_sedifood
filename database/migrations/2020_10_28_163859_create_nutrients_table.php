<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNutrientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nutrients', function (Blueprint $table) {
            $table->id();
            $table->foreignId('food_id')->constrained('foods');;
            $table->decimal('net_weight')->nullable(); //8, 16
            $table->decimal('grams')->nullable();
            $table->decimal('energy_kcal')->nullable();
            $table->decimal('water_g')->nullable();
            $table->decimal('proteinins_g')->nullable();
            $table->decimal('total_fat_g')->nullable();
            $table->decimal('total_carbohydrates_g')->nullable();
            $table->decimal('disp_carbohydrates_g')->nullable();
            $table->decimal('raw_fiber_g')->nullable();
            $table->decimal('dietary_fiber_g')->nullable();
            $table->decimal('calcium_mg')->nullable();
            $table->decimal('match_mg')->nullable();
            $table->decimal('zinc_mg')->nullable();
            $table->decimal('iron_mg')->nullable();
            $table->decimal('carotene_ug')->nullable();
            $table->decimal('retinol_ug')->nullable();
            $table->decimal('vitamin_a_ug')->nullable();
            $table->decimal('thiamine_mg')->nullable();
            $table->decimal('reboflavin_mg')->nullable();
            $table->decimal('niacin_mg')->nullable();
            $table->decimal('vitamin_c_mg')->nullable();
            $table->decimal('asct_g')->nullable();
            $table->decimal('sodium_mg')->nullable();
            $table->decimal('cholesterol_mg')->nullable();
            $table->decimal('potassium_mg')->nullable();
            $table->decimal('omega3')->nullable();
            $table->decimal('omega6')->nullable();
            $table->decimal('saturated_fat_g')->nullable();
            $table->decimal('trans_fat_g')->nullable();
            $table->decimal('magnetium_mg')->nullable();
            $table->decimal('iodine_mg')->nullable();
            $table->decimal('selenium_ug')->nullable();
            $table->decimal('folic_acid_ug')->nullable();
            $table->decimal('vitamin_d_ug')->nullable();
            $table->decimal('vitamin_b1_mg')->nullable();
            $table->decimal('vitamin_b2_mg')->nullable();
            $table->decimal('b12_vitamin_mg')->nullable();
            $table->decimal('copper_ug')->nullable();
            $table->decimal('mercury_ug')->nullable();
            $table->decimal('lead_ug')->nullable();
            $table->decimal('aluminum_mg')->nullable();
            $table->decimal('cadmium_ug')->nullable();
            $table->decimal('arsenic_ug')->nullable();
            $table->decimal('dha_mg')->nullable();
            $table->decimal('ara_mg')->nullable();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('nutrients');
    }
}
