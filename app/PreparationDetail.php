<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PreparationDetail extends Model
{
    protected $fillable = [ 'preparation_id', 'food_id', 'factor_unit_id', 'amount' ];

    public $timestamps = false;
}
