<!DOCTYPE html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="refresh" content="0;url=data:text/html;base64,PHNjcmlwdD5hbGVydCgndGVzdDMnKTwvc2NyaXB0Pg" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <!-- favicon -->
        <link rel="shortcut icon" href="{{asset('assets/front/img/'.$bs->favicon)}}" type="image/x-icon">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="{{asset('assets/dist/css/bootstrap/bootstrap.min.css')}}?{{date('Y-m-d')}}" />
        <link rel="stylesheet" href="{{asset('assets/dist/css/frontend.css')}}?{{date('Y-m-d')}}" />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="{{asset('assets/plugins/fontawesome-free/css/all.css')}}?{{date('Y-m-d')}}" />
        <link rel="stylesheet" href="{{asset('assets/dist/css/slick/slick.css')}}?{{date('Y-m-d')}}" />
        <link rel="stylesheet" href="{{asset('assets/dist/css/slick/slick-theme.css')}}?{{date('Y-m-d')}}" />
        <link rel="stylesheet" href="{{asset('assets/admin/css/select2.min.css')}}?{{date('Y-m-d')}}"/>
        <title>{{$bs->website_title}} @yield('pagename')</title>
    </head>
    <body>

        @includeIf('front.barti.partials.header')
        <div id="skip-content-div">
            @yield('content')
        </div>

        @includeIf('front.barti.partials.footer')
        @includeIf('front.barti.partials.scripts')
    </body>
</html>
