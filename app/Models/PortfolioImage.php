<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PortfolioImage extends Model
{
    public function portfolio() {
      return $this->belongsTo('App\Models\Portfolio');
    }
}
