<?php
use App\Preparation;
use App\PreparationDetail;
use App\Food;
use App\Unit;
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
        $units = Unit::all();
        foreach($preparations as $preparation)
        {
            $myFoods = $foods->random(rand(1, 2));
            foreach($myFoods as $food){
                $item = [];
                $item['preparation_id'] = $preparation->id;
                $item['food_id'] = $food->id_insumo;
                $item['unit_type'] = $food->unit_type;
                $item['unit_id'] = $units->where('type', $food->unit_type)->random(1)->first()->id;
                $item['amount'] = rand(1, 10);
                $data[] = $item;
            }
        }
        return $data;
    }
}
