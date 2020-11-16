<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Programming extends Model
{
    protected $fillable = [ 'date', 'company_id', 'professional_id', 'regimen_id', 'food_type_id' ];

    public $timestamps = false;
}
