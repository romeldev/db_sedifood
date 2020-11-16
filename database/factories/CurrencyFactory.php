<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Currency;
use Faker\Generator as Faker;

$factory->define(Currency::class, function (Faker $faker) {
    return [
        'descrip' => strtoupper($faker->words(rand(1, 2), true)),
        'symbol' => strtoupper($faker->randomLetter),
    ];
});
