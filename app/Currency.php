<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Currency extends Model
{
    protected $fillable = [ 'id', 'descrip', 'symbol' ];

    public $timestamps = false;
}
