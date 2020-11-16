<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{

    protected $fillable = [ 'order', 'label', 'icon', 'view', 'menu_id' ];

    public $timestamps = false;
}
