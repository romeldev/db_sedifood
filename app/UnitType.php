<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UnitType extends Model
{
    protected $fillable = [ 'id', 'descrip' ];

    public $timestamps = false;
}
