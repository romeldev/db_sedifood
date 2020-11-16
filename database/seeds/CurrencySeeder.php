<?php

use Illuminate\Database\Seeder;
use App\Currency;

class CurrencySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(Currency::Class, 10)->create();
        Currency::query()->delete();
        Currency::insert($this->data());
    }

    public function data()
    {
        return [
            [ 'id' => 1, 'descrip' => 'NUEVOS SOLES' , 'symbol' => 'S/. '],
            [ 'id' => 2, 'descrip' => 'DÓLAR AMERICANO' , 'symbol' => '$   '],
        ];
    }
}
