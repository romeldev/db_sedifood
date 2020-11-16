<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Preparation extends Model
{
    protected $fillable = [ 'descrip', 'preparation_type_id', 'company_id' ];

    public $timestamps = false;
}



