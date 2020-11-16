<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\UnitType;
use Faker\Generator as Faker;

$factory->define(UnitType::class, function (Faker $faker) {
    return [
        'descrip' => strtoupper($faker->words(1, true)),
    ];
});
