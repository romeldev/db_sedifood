<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Professional extends Model
{
    protected $fillable = [ 'id', 'fullname', 'profession', 'code' ];

    public $timestamps = false;
}
