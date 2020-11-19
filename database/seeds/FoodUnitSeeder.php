<?php

use Illuminate\Database\Seeder;
use Faker\Factory;
use App\FoodUnit;

class FoodUnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        FoodUnit::query()->delete();
        FoodUnit::insert( $this->data() );
    }

    public function data()
    {
        $faker = Factory::create();
        $data = [];
        $foods = App\Food::all();
        $units = App\Unit::all();

        $factors = [1, 1000, 50000 ];

        foreach($foods as $food)
        {
            foreach($units as $unit)
            {
                $data[] = [
                    'food_id' => $food->id,
                    'unit_id' => $unit->id,
                    'descrip' => strtoupper($faker->words(1, true)),
                    'factor' => $factors[$unit->id-1],
                ];
            }
        }

        return $data;
    }
}
