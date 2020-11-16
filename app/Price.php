<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Price extends Model
{
    protected $fillable = [ 'price', 'company_id', 'food_id', 'factor_unit_id', 'currency_id' ];

    public $timestamps = false;
}
