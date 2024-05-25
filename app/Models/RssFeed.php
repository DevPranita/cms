<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RssFeed extends Model
{
    protected $fillable = ['language_id','feed_name','feed_url','post_limit','read_more_button'];
    protected $table    = 'rss_feeds';
    public $timestamps  = false;

    public function rss(){
        return $this->hasMany('App\Models\RssPost');
    }

    public function language(){
        return $this->belongsTo('App\Models\Language','language_id');
    }
}
