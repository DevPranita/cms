<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Article extends Model
{
  public function articleCategory() {
    return $this->belongsTo('App\Models\ArticleCategory');
  }

  public function language() {
    return $this->belongsTo('App\Models\Language');
  }
}
