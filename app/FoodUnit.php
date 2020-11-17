<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FoodUnit extends Model
{
    protected $fillable = [ 'id', 'food_id', 'unit_id', 'descrip', 'factor' ];

    public $timestamps = false;
}
