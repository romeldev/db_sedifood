<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Regime;
use Faker\Generator as Faker;

$factory->define(Regime::class, function (Faker $faker) {
    return [
        'descrip' => strtoupper($faker->words(2, true)),
        'company_id' => App\Company::inRandomOrder()->first()->id,
    ];
});
