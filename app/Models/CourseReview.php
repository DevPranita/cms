<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CourseReview extends Model
{
  protected $fillable = [
    'user_id',
    'course_id',
    'comment',
    'rating'
  ];

  public function reviewedCourse()
  {
    return $this->belongsTo('App\Models\Course');
  }

  public function reviewByUser()
  {
    return $this->belongsTo('App\Models\User', 'user_id', 'id');
  }
}
