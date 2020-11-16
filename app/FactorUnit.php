<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class FactorUnit extends Model
{
    protected $fillable = [ 'id', 'food_id', 'food_type_id', 'descrip', 'factor' ];

    public $timestamps = false;
}
