<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Faq extends Model
{
  public $timestamps = false;

  public function faqCategory()
  {
    return $this->belongsTo('App\Models\FAQCategory', 'category_id', 'id');
  }
}
