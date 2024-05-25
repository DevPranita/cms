<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
  public $timestamps = false;

  public function scategory()
  {
    return $this->belongsTo('App\Models\Scategory');
  }

  public function portfolios()
  {
    return $this->hasMany('App\Models\Portfolio');
  }

  public function language()
  {
    return $this->belongsTo('App\Models\Language');
  }
}
