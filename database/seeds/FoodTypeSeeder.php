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
            [ 'id' => 1, 'descrip' => 'DESAYUNO' ],
            [ 'id' => 2, 'descrip' => 'ALMUERZO' ],
            [ 'id' => 3, 'descrip' => 'CENA' ],
            // [ 'id' => 4, 'descrip' => 'COMIDA' ],
            // [ 'id' => 5, 'descrip' => 'MEDIA MAÑANA' ],
            // [ 'id' => 6, 'descrip' => 'MEDIA TARDE' ],
            // [ 'id' => 7, 'descrip' => 'ADICIONALES' ],
        ];
    }
}
