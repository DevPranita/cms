<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Language extends Model
{
  protected $fillable = ['id', 'name', 'is_default', 'code', 'rtl'];

  public function basic_setting()
  {
    return $this->hasOne('App\Models\BasicSetting');
  }

  public function basic_extended()
  {
    return $this->hasOne('App\Models\BasicExtended', 'language_id');
  }

  public function basic_extra()
  {
    return $this->hasOne('App\Models\BasicExtra', 'language_id');
  }

  public function packages()
  {
    return $this->hasMany('App\Models\Package');
  }

  public function sliders()
  {
    return $this->hasMany('App\Models\Slider');
  }

  public function features()
  {
    return $this->hasMany('App\Models\Feature');
  }

  public function points()
  {
    return $this->hasMany('App\Models\Point');
  }

  public function statistics()
  {
    return $this->hasMany('App\Models\Statistic');
  }

  public function testimonials()
  {
    return $this->hasMany('App\Models\Testimonial');
  }

  public function members()
  {
    return $this->hasMany('App\Models\Member');
  }

  public function partners()
  {
    return $this->hasMany('App\Models\Partner');
  }

  public function ulinks()
  {
    return $this->hasMany('App\Models\Ulink');
  }

  public function pages()
  {
    return $this->hasMany('App\Models\Page');
  }

  public function scategories()
  {
    return $this->hasMany('App\Models\Scategory');
  }

  public function services()
  {
    return $this->hasMany('App\Models\Service');
  }

  public function portfolios()
  {
    return $this->hasMany('App\Models\Portfolio');
  }

  public function galleries()
  {
    return $this->hasMany('App\Models\Gallery');
  }

  public function faqs()
  {
    return $this->hasMany('App\Models\Faq');
  }

  public function bcategories()
  {
    return $this->hasMany('App\Models\Bcategory');
  }

  public function blogs()
  {
    return $this->hasMany('App\Models\Blog');
  }

  public function jcategories()
  {
    return $this->hasMany('App\Models\Jcategory');
  }

  public function jobs()
  {
    return $this->hasMany('App\Models\Job');
  }

  public function quote_inputs()
  {
    return $this->hasMany('App\Models\QuoteInput');
  }

  public function package_inputs()
  {
    return $this->hasMany('App\Models\PackageInput');
  }

  public function calendars()
  {
    return $this->hasMany('App\Models\CalendarEvent');
  }

  public function menus()
  {
    return $this->hasMany('App\Models\Menu');
  }

  public function feed()
  {
    return $this->hasMany('App\Models\RssFeed');
  }

  public function sitemaps()
  {
    return $this->hasMany('App\Models\Sitemap');
  }
  public function products()
  {
    return $this->hasMany('App\Models\Product');
  }
  public function event_categories()
  {
    return $this->hasMany('App\Models\EventCategory', 'lang_id');
  }
  public function events()
  {
    return $this->hasMany('App\Models\Event', 'lang_id');
  }
  public function causes()
  {
    return $this->hasMany('App\Models\Donation', 'lang_id');
  }
  public function course_categories()
  {
    return $this->hasMany('App\Models\CourseCategory');
  }
  public function courses()
  {
    return $this->hasMany('App\Models\Course');
  }
  public function shippings()
  {
    return $this->hasMany('App\Models\ShippingCharge');
  }
  public function pcategories()
  {
    return $this->hasMany('App\Models\Pcategory');
  }

  public function offline_gateways()
  {
    return $this->hasMany('App\Models\OfflineGateway');
  }

  public function homes()
  {
    return $this->hasMany('App\Models\Home');
  }

  public function articleCategories()
  {
    return $this->hasMany('App\Models\ArticleCategory');
  }

  public function articles()
  {
    return $this->hasMany('App\Models\Article');
  }

  public function megamenus()
  {
    return $this->hasMany('App\Models\Megamenu');
  }

  public function faqCategory()
  {
    return $this->hasMany('App\Models\FAQCategory');
  }

  public function galleryCategory()
  {
    return $this->hasMany('App\Models\GalleryCategory');
  }

  public function packageCategory()
  {
    return $this->hasMany('App\Models\PackageCategory');
  }

  public function popups() {
      return $this->hasMany('App\Models\Popup');
  }
}
