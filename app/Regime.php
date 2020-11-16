<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Regime extends Model
{
    protected $fillable = [ 'id', 'descrip' ];

    public $timestamps = false;
}
