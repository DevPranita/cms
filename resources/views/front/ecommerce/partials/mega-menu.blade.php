

@php
$catAvailable = true;
if ($link["type"] == 'services-megamenu' && serviceCategory()) {
    $data = $currentLang->megamenus()->where('type', 'services')->where('category', 1);
    $cats = $currentLang->scategories()->where('status', 1)->orderBy('serial_number', 'ASC')->get();
    $catModel = '\App\Models\Scategory';
    $itemModel = '\App\Models\Service';
    $allUrl = route("front.services");
} elseif ($link["type"] == 'products-megamenu') {
    $data = $currentLang->megamenus()->where('type', 'products')->where('category', 1);
    $cats = $currentLang->pcategories()->where('status', 1)->get();
    $catModel = '\App\Models\Pcategory';
    $itemModel = '\App\Models\Product';
    $allUrl = route("front.product");
} elseif ($link["type"] == 'portfolios-megamenu' && serviceCategory()) {
    $data = $currentLang->megamenus()->where('type', 'portfolios')->where('category', 1);
    $cats = $currentLang->scategories()->where('status', 1)->get();
    $catModel = '\App\Models\Scategory';
    $itemModel = '\App\Models\Portfolio';
    $allUrl = route('front.portfolios');
} elseif ($link["type"] == 'services-megamenu' && !serviceCategory()) {
    $data = $currentLang->megamenus()->where('type', 'services')->where('category', 0);
    $itemModel = '\App\Models\Service';
    $catAvailable = false;
} elseif ($link["type"] == 'portfolios-megamenu' && !serviceCategory()) {
    $data = $currentLang->megamenus()->where('type', 'portfolios')->where('category', 0);
    $itemModel = '\App\Models\Portfolio';
    $catAvailable = false;
} elseif ($link["type"] == 'courses-megamenu') {
    $data = $currentLang->megamenus()->where('type', 'courses')->where('category', 1);
    $cats = $currentLang->course_categories()->where('status', 1)->get();
    $catModel = '\App\Models\CourseCategory';
    $itemModel = '\App\Models\Course';
    $allUrl = route("courses");
} elseif ($link["type"] == 'causes-megamenu') {
    $data = $currentLang->megamenus()->where('type', 'causes')->where('category', 0);
    $itemModel = '\App\Models\Donation';
    $catAvailable = false;
} elseif ($link["type"] == 'events-megamenu') {
    $data = $currentLang->megamenus()->where('type', 'events')->where('category', 1);
    $cats = $currentLang->event_categories()->where('status', 1)->get();
    $catModel = '\App\Models\EventCategory';
    $itemModel = '\App\Models\Event';
    $allUrl = route("front.events");
} elseif ($link["type"] == 'blogs-megamenu') {
    $data = $currentLang->megamenus()->where('type', 'blogs')->where('category', 1);
    $cats = $currentLang->bcategories()->where('status', 1)->get();
    $catModel = '\App\Models\Bcategory';
    $itemModel = '\App\Models\Blog';
    $allUrl = route("front.blogs");
}

if ($data->count() > 0) {
    $megaMenus = $data->first()->menus;
    $megaMenus = json_decode($megaMenus, true);
} else {
    $megaMenus = [];
}
// dd($megaMenus);
@endphp

<li class="menu-item menu-item-has-children static mega-dropdown"><a href="{{$href}}">{{$link["text"]}}</a>
    <ul class="mega-menu">
        <li class="mega-wrap">
            <div class="row">
                @if ($catAvailable)
                    <div class="col-lg-2">
                        <div class="sidebar-menu megamenu-cats">
                            <div class="widget widget-categories">
                                <ul class="widget-link">
                                    <li class="active"><a href="{{$allUrl}}" data-tabid="all">{{__('All')}}</a></li>
                                    @foreach ($megaMenus as $mCatId => $mItemIds)
                                        @php
                                            $mcat = $catModel::where('id', $mCatId);
                                            if ($mcat->count() == 0) {
                                                continue;
                                            } else {
                                                $mcat = $mcat->first();
                                            }

                                            if ($link["type"] == 'services-megamenu') {
                                                $catUrl = route('front.services', ['category' => $mcat->id, 'term'=>request()->input('term')]);
                                            } elseif ($link["type"] == 'products-megamenu') {
                                                $catUrl = route('front.product', ['category_id' => $mcat->id]);
                                            } elseif ($link["type"] == 'portfolios-megamenu') {
                                                $catUrl = route('front.portfolios', ['category' => $mcat->id]);
                                            } elseif ($link["type"] == 'courses-megamenu') {
                                                $catUrl = route('courses', ['category_id' => $mcat->id]);
                                            } elseif ($link["type"] == 'events-megamenu') {
                                                $catUrl = route('front.events', ['category' => $mcat->id]);
                                            } elseif ($link["type"] == 'blogs-megamenu') {
                                                $catUrl = route('front.blogs', ['category' => $mcat->slug]);
                                            }
                                        @endphp
                                        <li><a href="{{$catUrl}}" data-tabid="#megaTab{{$link["type"]}}{{$mcat->id}}">{{$mcat->name}}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                @endif

                @php
                    if ($catAvailable) {
                        $colClass = 'col-lg-10';
                    } elseif (!$catAvailable) {
                        $colClass = 'col-lg-12';
                    }
                @endphp
                <div class="{{$colClass}}">
                    @if ($catAvailable)
                        @foreach ($megaMenus as $mCatId => $mItemIds)
                            @php
                                $mcat = $catModel::where('id', $mCatId);
                                if ($mcat->count() == 0) {
                                    continue;
                                } else {
                                    $mcat = $mcat->first();
                                }

                                if ($link["type"] == 'services-megamenu') {
                                    $catUrl = route('front.services', ['category' => $mcat->id, 'term'=>request()->input('term')]);
                                } elseif ($link["type"] == 'products-megamenu') {
                                    $catUrl = route('front.product', ['category_id' => $mcat->id]);
                                } elseif ($link["type"] == 'portfolios-megamenu') {
                                    $catUrl = route('front.portfolios', ['category' => $mcat->id]);
                                } elseif ($link["type"] == 'courses-megamenu') {
                                    $catUrl = route('courses', ['category_id' => $mcat->id]);
                                } elseif ($link["type"] == 'events-megamenu') {
                                    $catUrl = route('front.events', ['category' => $mcat->id]);
                                } elseif ($link["type"] == 'blogs-megamenu') {
                                    $catUrl = route('front.blogs', ['category' => $mcat->slug]);
                                }
                            @endphp
                            <div class="sidebar-main-wrapper">
                                <div class="mega-row mega-tab" id="megaTab{{$link["type"]}}{{$mCatId}}">
                                    <h4 class="title"><a href="{{$catUrl}}">{{$mcat->name}}</a></h4>

                                    <div class="row">
                                        @foreach ($mItemIds as $mItemId)
                                            @php
                                                $mItem = $itemModel::where('id', $mItemId);
                                                if ($mItem->count() == 0) {
                                                    continue;
                                                } else {
                                                    $mItem = $mItem->first();
                                                }
                                                if ($link['type'] == 'services-megamenu') {
                                                    $detailsUrl = route('front.servicedetails', [$mItem->slug]);
                                                    $imgSrc = asset('assets/front/img/services/' . $mItem->main_image);
                                                } elseif ($link["type"] == 'products-megamenu') {
                                                    $detailsUrl = route('front.product.details',$mItem->slug);
                                                    $imgSrc = asset('assets/front/img/product/featured/' . $mItem->feature_image);
                                                } elseif ($link["type"] == 'portfolios-megamenu') {
                                                    $detailsUrl = route('front.portfoliodetails',[$mItem->slug]);
                                                    $imgSrc = asset('assets/front/img/portfolios/featured/' . $mItem->featured_image);
                                                } elseif ($link["type"] == 'courses-megamenu') {
                                                    $detailsUrl = route('course_details',[$mItem->slug]);
                                                    $imgSrc = asset('assets/front/img/courses/' . $mItem->course_image);
                                                } elseif ($link["type"] == 'events-megamenu') {
                                                    $eventImg = json_decode($mItem->image, true);
                                                    $detailsUrl = route('front.event_details',[$mItem->slug]);
                                                    $imgSrc = !empty($eventImg) ? asset('assets/front/img/events/sliders/' . $eventImg[0]) : '';
                                                } elseif ($link["type"] == 'blogs-megamenu') {
                                                    $detailsUrl = route('front.blogdetails',[$mItem->slug]);
                                                    $imgSrc = asset('assets/front/img/blogs/' . $mItem->main_image);
                                                }
                                            @endphp
                                            <div class="col-lg-3 col-md-6">
                                                <div class="box-item">
                                                    <div class="box-img">
                                                        <a href="{{$detailsUrl}}" class="d-block">
                                                            <img class="lazy" data-src="{{$imgSrc}}" alt="Image" style="width: 100%;">
                                                        </a>
                                                    </div>
                                                    <div class="box-info">
                                                        <h4><a href="{{$detailsUrl}}">{{strlen($mItem->title) > 30 ? mb_substr($mItem->title,0,30,'utf-8') . '...' : $mItem->title}}</a></h4>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    @elseif (!$catAvailable)
                        <div class="sidebar-main-wrapper">
                            @foreach ($megaMenus as $mItemId)
                                @if ($loop->iteration % 5 == 1)
                                <div class="row mega-row">
                                @endif
                                    @php
                                        $mItem = $itemModel::where('id', $mItemId);
                                        if ($mItem->count() == 0) {
                                            continue;
                                        } else {
                                            $mItem = $mItem->first();
                                        }
                                        if ($link['type'] == 'services-megamenu') {
                                            $detailsUrl = route('front.servicedetails', [$mItem->slug]);
                                            $imgSrc = asset('assets/front/img/services/' . $mItem->main_image);
                                        } elseif ($link['type'] == 'portfolios-megamenu') {
                                            $detailsUrl = route('front.portfoliodetails',[$mItem->slug]);
                                            $imgSrc = asset('assets/front/img/portfolios/featured/' . $mItem->featured_image);
                                        } elseif ($link["type"] == 'causes-megamenu') {
                                            $detailsUrl = route('front.cause_details',[$mItem->slug]);
                                            $imgSrc = asset('assets/front/img/donations/' . $mItem->image);
                                        }
                                    @endphp
                                    <div class="col">
                                        <div class="box-item">
                                            <div class="box-img">
                                                <a href="{{$detailsUrl}}" class="d-block">
                                                    <img class="lazy" data-src="{{$imgSrc}}" alt="Megamenu Image" style="width: 100%;">
                                                </a>
                                            </div>
                                            <div class="box-info">
                                                <h4><a href="{{$detailsUrl}}">{{strlen($mItem->title) > 30 ? mb_substr($mItem->title,0,30,'utf-8') . '...' : $mItem->title}}</a></h4>
                                            </div>
                                        </div>
                                    </div>
                                    @if ($loop->last)
                                        @php
                                            $left = 5 - (count($megaMenus) % 5);
                                        @endphp
                                        @if($left < 5)
                                            @for($i=0; $i < $left; $i++)
                                                <div class="col"></div>
                                            @endfor
                                        @endif
                                    @endif

                                @if ($loop->iteration % 5 == 0)
                                </div>
                                @endif
                            @endforeach
                        </div>
                    @endif
                </div>
            </div>
        </li>
    </ul>
</li>