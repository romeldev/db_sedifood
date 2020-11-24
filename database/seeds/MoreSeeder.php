<?php

use Illuminate\Database\Seeder;

class MoreSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $query_functions = File::get("database\migrations\x_functions.sql");
        DB::unprepared($query_functions);

        $query_views = File::get("database\migrations\x_views.sql");
        DB::unprepared($query_views);

        // $query_procedures = File::get("database\migrations\x_procedures.sql");
        // DB::unprepared($query_procedures);
        // dd("ok");
    }
}
