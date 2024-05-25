<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Module extends Model
{
  public function moduleBelongsToCourse()
  {
    return $this->belongsTo('App\Models\Course');
  }

  public function lessons()
  {
    return $this->hasMany('App\Models\Lesson');
  }
}
