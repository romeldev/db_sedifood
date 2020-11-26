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
            $table->foreignId('preparation_id')->constrained('preparations');
            $table->foreignId('food_id');
            $table->foreignId('unit_id')->constrained('units');
            $table->integer('unit_type');
            $table->decimal('amount', 16, 6)->default(0);
            $table->decimal('amount_m', 16, 6)->default(0);
            $table->decimal('amount_s', 16, 6)->default(0);
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
