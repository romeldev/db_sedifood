<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FoodGroup extends Model
{
    protected $fillable = [ 'id', 'descrip', 'abrev' ];

    public $timestamps = false;
}
