<?php

use Illuminate\Database\Seeder;
use App\Price;
use App\Company;
use App\Food;
use App\Factor;

class PriceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Price::query()->delete();

        $datas = collect($this->data());

        foreach($datas->chunk(1000) as $data){
            Price::insert( $data->toArray() );
        }
        
    }

    public function data(){
        $min=1; $max=5;
        $data = [];
        $companies = Company::all();
        $factorUnits = FactorUnit::all();

        $foods = Food::all();

        $countFood = [];
        foreach($companies as $company){
            foreach($foods as $food){
                $myFactorUnits = $factorUnits->where('food_id', $food->id);
                foreach($myFactorUnits as $factorUnit){
                    $data[] = [
                        'company_id' => $company->id,
                        'food_id' => $food->id,
                        'factor_unit_id' => $factorUnit->id,
                        'currency_id' => 1,
                        'price' => rand($min*10, $max*10)/10,
                    ];
                }
            }
        }
        return $data;
    }
}
