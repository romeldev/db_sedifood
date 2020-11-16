<?php

use Illuminate\Database\Seeder;
use App\Company;

class CompanySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        // factory(App\Company::Class, 5)->create();
        Company::query()->delete();
        Company::insert($this->data());
    }

    public function data()
    {
        return [
            [ 'id' => 3, 'descrip' => 'PRINCIPAL' ],
            [ 'id' => 4, 'descrip' => 'OTRA EMPRESA' ],
            [ 'id' => 5, 'descrip' => 'CATERING PERU' ],
            [ 'id' => 13, 'descrip' => 'RED SABOGAL' ],
            [ 'id' => 14, 'descrip' => 'MINISTERIO' ],
            [ 'id' => 15, 'descrip' => 'INS' ],
            [ 'id' => 16, 'descrip' => 'SODEXO' ],
            [ 'id' => 17, 'descrip' => 'APC' ],
        ];
    }
}
