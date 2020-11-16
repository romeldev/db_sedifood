<?php

use Illuminate\Database\Seeder;
use App\UnitType;

class UnitTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(App\UnitType::class, 3)->create();
        UnitType::query()->delete();
        UnitType::insert($this->data());
    }

    public function data()
    {
        return [
            [ 'id' => 1, 'descrip' => 'MINIMA UNIDAD' ],
            [ 'id' => 2, 'descrip' => 'ESTANDAR' ],
            [ 'id' => 3, 'descrip' => 'MEDIDA CASERA' ],
        ];
    }
}
