<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Portfolio extends Model
{
  protected $fillable = ['id', 'language_id', 'title', 'slug', 'start_date', 'submission_date', 'client_name', 'tags', 'featured_image', 'content', 'service_id', 'status', 'serial_number', 'meta_keywords', 'meta_description', 'website_link'];

  public function portfolio_images()
  {
    return $this->hasMany('App\Models\PortfolioImage');
  }

  public function service()
  {
    return $this->belongsTo('App\Models\Service');
  }

  public function language()
  {
    return $this->belongsTo('App\Models\Language');
  }
}
