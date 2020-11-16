<?php

use Illuminate\Database\Seeder;
use App\PreparationType;

class PreparationTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(App\PreparationType::class, 5)->create();
        PreparationType::query()->delete();
        PreparationType::insert($this->data());
    }

    public function data()
    {
        return [
            [ 'id' => 1, 'descrip' => 'JUGOS' ],
            [ 'id' => 2, 'descrip' => 'CEREALES' ],
            [ 'id' => 3, 'descrip' => 'BEBIDAS' ],
            [ 'id' => 4, 'descrip' => 'SANDWICHS' ],
            [ 'id' => 5, 'descrip' => 'SOPAS' ],
            [ 'id' => 6, 'descrip' => 'ENTRADAS' ],
            [ 'id' => 7, 'descrip' => 'PLATOS FONDO POLLO' ],
            [ 'id' => 8, 'descrip' => 'PLATOS FONDO RES' ],
            [ 'id' => 9, 'descrip' => 'PLATOS FONDO PESCADO' ],
            [ 'id' => 10, 'descrip' => 'PLATOS FONDO CERDO' ],
            [ 'id' => 11, 'descrip' => 'PLATOS FONDO VISCERAS' ],
            [ 'id' => 12, 'descrip' => 'MENESTRAS' ],
            [ 'id' => 13, 'descrip' => 'PASTAS, SALSAS Y OTROS' ],
            [ 'id' => 14, 'descrip' => 'POSTRES' ],
            [ 'id' => 15, 'descrip' => 'REFRESCOS' ],
            [ 'id' => 16, 'descrip' => 'GUARNICIONES' ],
            [ 'id' => 17, 'descrip' => 'FORMULAS' ],
            [ 'id' => 18, 'descrip' => 'FORMULAS PARENTERALES' ],
            [ 'id' => 25, 'descrip' => 'SALAD BAR' ],
            [ 'id' => 26, 'descrip' => 'INVESTIGACION' ],
        ];
    }
}
