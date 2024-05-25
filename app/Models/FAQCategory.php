<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FAQCategory extends Model
{
  protected $table = 'faq_categories';

  protected $fillable = [
    'language_id',
    'name',
    'status',
    'serial_number'
  ];

  public function faqCategoryLang()
  {
    return $this->belongsTo('App\Models\Language');
  }

  public function frequentlyAskedQuestion()
  {
    return $this->hasMany('App\Models\Faq', 'category_id', 'id');
  }
}
