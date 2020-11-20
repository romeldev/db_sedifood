<?php

use Illuminate\Database\Seeder;
use App\FoodGroup;

class FoodGroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(FoodGroup::class, 10)->create();
        FoodGroup::query()->delete();
        FoodGroup::insert($this->data());
    }

    public function data()
    {
        return [
            [ 'id' => 1, 'abrev' => 'A' , 'descrip' => 'CEREALES Y DERIVADOS' ],
            [ 'id' => 2, 'abrev' => 'B' , 'descrip' => 'VERDURAS, HORTALIZAS Y DERIVADOS' ],
            [ 'id' => 3, 'abrev' => 'C' , 'descrip' => 'FRUTAS Y DERIVADOS' ],
            [ 'id' => 4, 'abrev' => 'D' , 'descrip' => 'GRASAS, ACEITES Y OLEAGINOSAS' ],
            [ 'id' => 5, 'abrev' => 'E' , 'descrip' => 'PESCADOS Y MARISCOS' ],
            [ 'id' => 6, 'abrev' => 'F' , 'descrip' => 'CARNES Y DERIVADOS' ],
            [ 'id' => 7, 'abrev' => 'G' , 'descrip' => 'LECHES Y DERIVADOS' ],
            [ 'id' => 8, 'abrev' => 'H' , 'descrip' => 'BEBIDAS (ALCOHÓLICAS Y ANALCOHÓLICAS)' ],
            [ 'id' => 9, 'abrev' => 'J' , 'descrip' => 'HUEVOS Y DERIVADOS' ],
            [ 'id' => 10, 'abrev' => 'K' , 'descrip' => 'PRODUCTOS AZUCARADOS' ],
            [ 'id' => 11, 'abrev' => 'L' , 'descrip' => 'MISCELANEOS' ],
            [ 'id' => 12, 'abrev' => 'P' , 'descrip' => 'OTROS ALIMENTOS' ],
            [ 'id' => 13, 'abrev' => 'Q' , 'descrip' => 'ALIMENTOS INFANTILES' ],
            [ 'id' => 14, 'abrev' => 'T' , 'descrip' => 'LEGUMINOSAS Y DERIVADOS' ],
            [ 'id' => 15, 'abrev' => 'U' , 'descrip' => 'TUBÉRCULOS Y RAICES' ],
            [ 'id' => 16, 'abrev' => 'V' , 'descrip' => 'TUBÉRCULOS ANDINOS' ],
            [ 'id' => 17, 'abrev' => 'X' , 'descrip' => 'FORMULAS ENTERALES' ],
        ];
    }
}
