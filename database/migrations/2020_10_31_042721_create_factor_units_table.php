<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFactorUnitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('factor_units', function (Blueprint $table) {
            $table->id();
            $table->string('descrip');
            $table->decimal('factor');
            $table->foreignId('food_id')->constrained('foods');
            $table->foreignId('unit_type_id')->constrained('unit_types');
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
        Schema::dropIfExists('factor_units');
    }
}
