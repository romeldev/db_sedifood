<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\FoodGroup;
use Faker\Generator as Faker;

$factory->define(FoodGroup::class, function (Faker $faker) {
    return [
        'descrip' => strtoupper($faker->words(rand(3, 5), true)),
        'abrev' => strtoupper($faker->stateAbbr),
    ];
});
