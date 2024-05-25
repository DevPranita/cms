<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ulink extends Model
{
    public $timestamps = false;

    public function language() {
        return $this->belongsTo('App\Models\Language');
    }
}
