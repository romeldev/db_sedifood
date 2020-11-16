<?php
use App\Preparation;
use App\PreparationDetail;
use App\Food;
use Illuminate\Database\Seeder;

class PreparationDetailSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        PreparationDetail::insert($this->data());
    }

    public function data()
    {
        $data = [];
        $preparations = Preparation::all();

        $foods = Food::all();
        foreach($preparations as $preparation)
        {
            $myFoods = $foods->random(rand(2, 5));
            foreach($myFoods as $food){
                $item = [];
                $item['preparation_id'] = $preparation->id;
                $item['food_id'] = $food->id;
                $item['factor_unit_id'] = $food->factorUnits()->inRandomOrder()->first()->id;
                $item['amount'] = rand(1, 10);
                $data[] = $item;
            }
        }
        return $data;
    }
}
