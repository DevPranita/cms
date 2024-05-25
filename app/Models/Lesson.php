<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lesson extends Model
{
  public function lessonBelongsToModule()
  {
    return $this->belongsTo('App\Models\Module');
  }
}
