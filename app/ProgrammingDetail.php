<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProgrammingDetail extends Model
{
    protected $fillable = [ 'programming_id', 'preparation_id', 'portions' ];

    public $timestamps = false;
}
