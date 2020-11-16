<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PreparationType extends Model
{
    protected $fillable = [ 'preparation_id', 'food_id', 'factory_unit_id', 'amount' ];

    public $timestamps = false;
}
