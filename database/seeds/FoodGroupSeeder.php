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
            [ 'id' => 1, 'abrev' => 'Z' , 'descrip' => 'VARIOS' ],
            [ 'id' => 2, 'abrev' => 'A' , 'descrip' => 'CEREALES Y DERIVADOS' ],
            [ 'id' => 3, 'abrev' => 'B' , 'descrip' => 'VERDURAS, HORTALIZAS Y DERIVADOS' ],
            [ 'id' => 4, 'abrev' => 'C' , 'descrip' => 'FRUTAS Y DERIVADOS' ],
            [ 'id' => 5, 'abrev' => 'D' , 'descrip' => 'GRASAS, ACEITES Y OLEAGINOSAS' ],
            [ 'id' => 6, 'abrev' => 'E' , 'descrip' => 'PESCADOS Y MARISCOS' ],
            [ 'id' => 7, 'abrev' => 'F' , 'descrip' => 'CARNES Y DERIVADOS' ],
            [ 'id' => 8, 'abrev' => 'G' , 'descrip' => 'LECHES Y DERIVADOS' ],
            [ 'id' => 9, 'abrev' => 'H' , 'descrip' => 'BEBIDAS (ALCOHÓLICAS Y ANALCOHÓLICAS)' ],
            [ 'id' => 10, 'abrev' => 'J' , 'descrip' => 'HUEVOS Y DERIVADOS' ],
            [ 'id' => 11, 'abrev' => 'K' , 'descrip' => 'PRODUCTOS AZUCARADOS' ],
            [ 'id' => 12, 'abrev' => 'L' , 'descrip' => 'MISCELANEOS' ],
            [ 'id' => 13, 'abrev' => 'P' , 'descrip' => 'OTROS ALIMENTOS' ],
            [ 'id' => 14, 'abrev' => 'Q' , 'descrip' => 'ALIMENTOS INFANTILES' ],
            [ 'id' => 15, 'abrev' => 'T' , 'descrip' => 'LEGUMINOSAS Y DERIVADOS' ],
            [ 'id' => 16, 'abrev' => 'U' , 'descrip' => 'TUBÉRCULOS Y RAICES' ],
            [ 'id' => 17, 'abrev' => 'V' , 'descrip' => 'TUBÉRCULOS ANDINOS' ],
            [ 'id' => 18, 'abrev' => 'X' , 'descrip' => 'FORMULAS ENTERALES' ],
        ];
    }
}
