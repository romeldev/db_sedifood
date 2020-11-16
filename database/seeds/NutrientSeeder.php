<?php

use Illuminate\Database\Seeder;
use App\Food;
use App\Nutrient;

class NutrientSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\Nutrient::insert($this->data());
    }

    public function data()
    {
        $data = [];
        $foods = Food::all();
        $nutrients = Nutrient::Nutrients();
        foreach($foods as $food)
        {
            $item['net_weight'] = 100;
            
            $item['grams'] = 100;
            $item['food_id'] = $food->id;

            $semilla = 1;
            foreach($nutrients as $column)
            {
                // $item[$column] = rand((int)$semilla, (int)($semilla*10));
                // $semilla = $semilla*10;
                $item[$column] = rand(10, 100);
            }
            $data[] = $item;
        }

        return $data;
    }
}
