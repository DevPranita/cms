<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    protected $fillable = [
        'user_id',
        'admin_id',
        'ticket_number',
        'subject',
        'message',
        'zip_file',
        'last_message'
    ];

    public function messages() {
        return $this->hasMany('App\Models\Conversation');
      }
    public function admin() {
        return $this->belongsTo('App\Models\Admin');
      }
    public function user() {
        return $this->belongsTo('App\Models\User');
      }

}
