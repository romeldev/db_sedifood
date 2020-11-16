<?php

use Illuminate\Database\Seeder;
use App\Professional;

class ProfessionalSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(App\Professional::Class, 10)->create();
        Professional::query()->delete();
        Professional::insert($this->data());
    }

    public function data()
    {
        return [
            [ 'id' => 2, 'fullname' => 'LUIS PALOMINO' , 'profession' => 'NUTRICIONISTA' , 'code' => '3814' ],
            [ 'id' => 3, 'fullname' => 'ROSA ROMERO SERAS' , 'profession' => 'NUTRICIONISTA' , 'code' => '3151' ],
            [ 'id' => 4, 'fullname' => 'CAROLINA R. LIPE CAMERO' , 'profession' => 'NUTRICIONISTA' , 'code' => '1234' ],
        ];
    }
}
