<?php

use Illuminate\Database\Seeder;
use App\Unit;

class UnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(Unit::class, 3)->create();
        Unit::query()->delete();
        Unit::insert($this->data());
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
