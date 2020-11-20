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
        PreparationDetail::query()->delete();
        PreparationDetail::insert($this->data());
    }

    public function data()
    {
        $data = [];
        $preparations = Preparation::all();

        $foods = Food::all();
        foreach($preparations as $preparation)
        {
            $myFoods = $foods->random(rand(1, 2));
            foreach($myFoods as $food){
                $item = [];
                $item['preparation_id'] = $preparation->id;
                $item['food_id'] = $food->id;
                $item['unit_id'] = rand(2,3);
                $item['amount'] = rand(1, 10);
                $data[] = $item;
            }
        }
        return $data;
    }
}
