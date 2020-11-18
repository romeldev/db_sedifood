<?php

use Illuminate\Database\Seeder;
use App\Price;
use App\Company;
use App\Food;
use App\Unit;

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
        $min=5; $max=20;
        $data = [];
        $companies = Company::all();
        $units = Unit::all();
        $foods = Food::all();
        foreach($companies as $company){
            foreach($foods as $food){
                foreach($units as $unit){
                    $data[] = [
                        'company_id' => $company->id,
                        'food_id' => $food->id,
                        'unit_id' => $unit->id,
                        'currency_id' => 1,
                        'price' => rand($min*10, $max*10)/10,
                    ];
                }
            }
        }
        return $data;
    }
}
