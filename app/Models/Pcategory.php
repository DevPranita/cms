<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pcategory extends Model
{
    protected $fillable = ['name','image','language_id','status','slug'];

    public function products() {
        return $this->hasMany('App\Models\Product','category_id','id');
    }

    public function language() {
        return $this->belongsTo('App\Models\Language');
    }
}
