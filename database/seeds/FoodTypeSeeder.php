<?php

use Illuminate\Database\Seeder;
use App\FoodType;

class FoodTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(App\FoodType::class, 5)->create();
        FoodType::query()->delete();
        FoodType::insert($this->data());
    }

    public function data() {
        return [
            [ 'id' => 8, 'descrip' => 'DESAYUNO' ],
            [ 'id' => 9, 'descrip' => 'ALMUERZO' ],
            [ 'id' => 10, 'descrip' => 'COMIDA' ],
            [ 'id' => 11, 'descrip' => 'CENA' ],
            [ 'id' => 12, 'descrip' => 'MEDIA MAÑANA' ],
            [ 'id' => 13, 'descrip' => 'MEDIA TARDE' ],
            [ 'id' => 14, 'descrip' => 'ADICIONALES' ],
        ];
    }
}
