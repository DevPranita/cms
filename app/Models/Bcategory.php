<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Bcategory extends Model
{
    public $timestamps = false;

    public function blogs() {
      return $this->hasMany('App\Models\Blog');
    }
}
