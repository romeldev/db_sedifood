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
            [ 'id' => '1', 'abrev' => 'u',  'name' => 'UNIDAD', 'factor' => '1', 'type' => '1', 'forever' => '1' ],
            [ 'id' => '2', 'abrev' => 'g',  'name' => 'GRAMOS', 'factor' => '1', 'type' => '2', 'forever' => '1' ],
            [ 'id' => '3', 'abrev' => 'kg',  'name' => 'KILOS', 'factor' => '1000', 'type' => '2', 'forever' => '1' ],
            [ 'id' => '4', 'abrev' => 'ml',  'name' => 'MILILITROS', 'factor' => '1', 'type' => '3', 'forever' => '1' ],
            [ 'id' => '5', 'abrev' => 'l',  'name' => 'LITRO', 'factor' => '1000', 'type' => '3', 'forever' => '1' ],
        ];
    }
}
