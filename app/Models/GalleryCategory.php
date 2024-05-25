<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GalleryCategory extends Model
{
  protected $fillable = [
    'language_id',
    'name',
    'status',
    'serial_number'
  ];

  public function galleryCategoryLang()
  {
    return $this->belongsTo('App\Models\Language');
  }

  public function galleryImg()
  {
    return $this->hasMany('App\Models\Gallery', 'category_id', 'id');
  }
}
