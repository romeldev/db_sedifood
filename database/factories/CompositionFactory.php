<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Composition;
use Faker\Generator as Faker;

$factory->define(Composition::class, function (Faker $faker) {
    return [
        'descrip' => strtoupper($faker->words(2, true)),
    ];
});
