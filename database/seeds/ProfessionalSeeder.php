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
            [ 'id' => 2, 'fullname' => 'GABRIELA URIARTE' , 'profession' => 'NUTRICIONISTA' , 'code' => '1230' ],
            [ 'id' => 3, 'fullname' => 'PABLO SUMAQUERO' , 'profession' => 'NUTRICIONISTA' , 'code' => '4560' ],
            [ 'id' => 4, 'fullname' => 'CARLOS FERNANDO' , 'profession' => 'NUTRICIONISTA' , 'code' => '7890' ],
        ];
    }
}
