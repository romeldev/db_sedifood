<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\PreparationType;
use Faker\Generator as Faker;

$factory->define(PreparationType::class, function (Faker $faker) {
    return [
        'descrip' => strtoupper($faker->words(rand(3, 5), true)),
     ];
});
