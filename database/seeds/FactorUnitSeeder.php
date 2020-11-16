<?php

use Illuminate\Database\Seeder;
use Faker\Factory;

class FactorUnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\FactorUnit::insert( $this->data() );
    }

    public function data()
    {
        $faker = Factory::create();
        $data = [];
        $foods = App\Food::all();
        $units = App\UnitType::all();
        foreach($foods as $food)
        {
            foreach($units as $unit)
            {
                $data[] = [
                    'food_id' => $food->id,
                    'unit_type_id' => $unit->id,
                    'descrip' => strtoupper($faker->words(1, true)),
                    'factor' => rand(1, 1000),
                ];
            }
        }

        return $data;
    }
}
