<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PackageCategory extends Model
{
  protected $table = 'package_categories';

  protected $fillable = [
    'language_id',
    'name',
    'status',
    'serial_number'
  ];

  public function packageCategoryLang()
  {
    return $this->belongsTo('App\Models\Language');
  }

  public function packageList()
  {
    return $this->hasMany('App\Models\Package', 'category_id', 'id');
  }
}
