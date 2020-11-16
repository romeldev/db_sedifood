<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Professional;
use Faker\Generator as Faker;

$factory->define(Professional::class, function (Faker $faker) {
    return [
        'fullname' => strtoupper($faker->name),
        'profession' => strtoupper($faker->words(2, true)),
        'code' => $faker->numerify('####')
    ];
});
