<?php

use Illuminate\Database\Seeder;
use App\ProgrammingDetail;
use App\Programming;
use App\Preparation;

class ProgrammingDetailSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        ProgrammingDetail::query()->delete();
        ProgrammingDetail::insert( $this->data() );
    }

    public function data()
    {
        $data = [];
        $programmings = Programming::all();
        $preparations = Preparation::all();

        foreach( $programmings as $programming)
        {
            $myPreparations = $preparations->where('company_id', $programming->company_id);

            $numDetails = rand(2, 5);
            for($i=0; $i< $numDetails; $i++)
            {
                $data[] =[
                    'programming_id' => $programming->id,
                    'preparation_id' => $myPreparations->random(1)->first()->id,
                    'portions' => rand(100, 200),
                ];
            }
        }
        return $data;
    }
}
