<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Composition extends Model
{
    protected $fillable = [ 'id', 'descrip' ];

    public $timestamps = false;
}
