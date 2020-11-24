<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAssetsView extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared("
        alter table insumo add column food_group_id int(20) not null default 1; -- grupo varios
        alter table insumo add column unit_type int(20) not null default 1; -- unidad masa (gramos, kilogramos,...)
        ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
       // Schema::dropIfExists('assets_view');
    }
}
