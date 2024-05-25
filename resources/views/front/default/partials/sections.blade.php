<section class="banner pb-3">
    <div class="container-fluid p-0">
        <div class="row m-0">
            <div class="col-lg-8 col-md-12 col-sm-12 p-0">
                <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                      @if (!empty($sliders))
                        @foreach ($sliders as $key => $slider)
                          @if($key == 0)
                          <div class="carousel-item active">
                              <img class="d-block w-100" src="{{asset('assets/front/img/sliders/'.$slider->image)}}" alt="First slide" />
                          </div>
                          @else
                          <div class="carousel-item">
                              <img class="d-block w-100" src="{{asset('assets/front/img/sliders/'.$slider->image)}}" alt="Second slide" />
                          </div>
                          @endif
                        @endforeach
                      @endif
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12 bg_lig_blue p-0 slider_right">
                <div class="banner_right_side p-3">
                    <div class="section_title mb-3">
                        <h6 class="text-orange text-uppercase mb-1">about</h6>
                        <h3 class="fw_600">{{convertUtf8($bs->hero_section_title)}}</h3>
                    </div>
                    <p class="text-secondary fs_14 detail_text text-justify">
                        {{convertUtf8($bs->hero_section_text)}}
                    </p>
                    @if(!empty(convertUtf8($bs->hero_section_button_text)))
                    <a href="{{$bs->hero_section_button_url}}" target="_blank" rel="noopener noreferrer" class="btn-lg bg_theme_dark_blue text-white theme_btn text-uppercase">{{convertUtf8($bs->hero_section_button_text)}}</a>
                    @endif
                </div>
                <div class="dirctor_coner bg-white m-2 p-3 theme_shadow border-round-10">
                    <div class="row m-0 align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-12 pl-0">
                            <div class="user_profile rounded-circle overflow-hidden">
                                <img src="assets/dist/img/front/dr_k_s_james.png" alt="" />
                            </div>
                        </div>
                        <div class="col-lg-5 col-md-4 col-sm-12 pl-0 middel_column">
                            <h5 class="fs_15 font-weight-bold">Dr. K. S. James</h5>
                            <h6 class="fs_13 font-weight-bold mb-0">Director & Sr. Professor</h6>
                        </div>
                        <div class="col-lg-4 col-md-4 col-sm-12 pr-0 pl-0 text-right ">
                            <a href="http://" target="_blank" rel="noopener noreferrer" class="btn bg_theme_dark_blue text-white text-decoration-none text-uppercase d-flex px-2 py-3 justify-content-center fs_13">
                                Director’s corner
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>