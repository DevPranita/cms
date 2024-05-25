<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class QuoteInputOption extends Model
{
    protected $fillable = ['type', 'label', 'name', 'placeholder', 'required'];

    public function quote_input() {
        return $this->belongsTo('App\Models\QuoteInput');
    }
}
