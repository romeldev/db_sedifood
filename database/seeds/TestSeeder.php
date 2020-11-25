<?php

use Illuminate\Database\Seeder;

class TestSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::unprepared("delete from programming_details;
        delete from programmings;
        delete from preparation_details;
        delete from preparations;
        delete from preparation_types;
        delete from currencies;
        delete from professionals;
        delete from nutrients;
        delete from regimes;
        delete from food_types;
        delete from food_groups;
        delete from compositions;");
    }
}
