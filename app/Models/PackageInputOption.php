<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PackageInputOption extends Model
{
    protected $fillable = ['type', 'label', 'name', 'placeholder', 'required'];

    public function package_input() {
        return $this->belongsTo('App\Models\PackageInput');
    }
}
