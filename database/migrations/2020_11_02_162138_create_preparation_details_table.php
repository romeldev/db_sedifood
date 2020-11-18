<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePreparationDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('preparation_details', function (Blueprint $table) {
            $table->id();
            $table->decimal('amount');
            $table->foreignId('preparation_id')->constrained('preparations');
            $table->foreignId('food_id')->constrained('foods');
            $table->foreignId('unit_id')->constrained('units');
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
        Schema::dropIfExists('preparation_details');
    }
}
