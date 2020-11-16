<?php

use Illuminate\Database\Seeder;
use App\Composition;

class CompositionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(App\Composition::Class, 10)->create();
        Composition::query()->delete();
        Composition::insert($this->data());
    }

    public function data()
    {
        return [
            [ 'id' => 1, 'descrip' => 'TABLAS PERUANAS DE COMPOSICION 2017' ],
            [ 'id' => 2, 'descrip' => 'ALIMENTOS CHILENOS' ],
            [ 'id' => 3, 'descrip' => 'ALIMENTOS AMERICA LATINA' ],
            [ 'id' => 4, 'descrip' => 'ALIMENTOS INDUSTRIALIZADOS INAN' ],
            [ 'id' => 5, 'descrip' => 'PRODUCTOR' ],
            [ 'id' => 6, 'descrip' => 'TABLAS AUXILIARES INS.' ],
            [ 'id' => 7, 'descrip' => 'TABLAS DE METALES PESADOS' ],
            [ 'id' => 8, 'descrip' => 'TABLA ALIMENTOS TRAZAS' ],
        ];
    }
}
