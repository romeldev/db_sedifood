<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Preparation;
use App\PreparationType;
use App\Company;
use Faker\Generator as Faker;

$factory->define(Preparation::class, function (Faker $faker) {
    return [
        'descrip' => strtoupper($faker->words(rand(3, 5), true)),
        'preparation_type_id' => PreparationType::inRandomOrder()->first()->id,
        'company_id' => Company::inRandomOrder()->first()->id,
    ];
});
