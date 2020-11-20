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
        DB::statement("create or replace view companies as
        select id_almacen as id, nombre as descrip, IF(estado=1, NULL, 0) as deleted_at from almacen");

        DB::statement("create or replace view foods as
        select id_insumo as id, nombre as descrip, 1 as food_group_id, if(estado=1,null, 0) as deleted_at from insumo");
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
