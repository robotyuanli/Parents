<!DOCTYPE html>
<html lang="{{ config('app.locale') }}">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        {{-- CSRF Token --}}
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>Parents evening booking system</title>
        <meta name="description" content="">
        <meta name="author" content="Jeremy Kenedy">
        <link rel="shortcut icon" href="/favicon.ico">

        {{-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries --}}
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
            <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

        {{-- Fonts --}}
        @yield('template_linked_fonts')

        {{-- Styles --}}
        <link href="{{ mix('/css/app.css') }}" rel="stylesheet">
        <link href="{{URL::to('/')}}/css/bootstrap.min.css" rel="stylesheet">
        <link href="{{ url('/css/style.css') }}" rel="stylesheet">

        @yield('template_linked_css')

        <style type="text/css">
            @yield('template_fastload_css')

            @if (Auth::User() && (Auth::User()->profile) && (Auth::User()->profile->avatar_status == 0))
                .user-avatar-nav {
                    background: url({{ Gravatar::get(Auth::user()->email) }}) 50% 50% no-repeat;
                    background-size: auto 100%;
                }
            @endif

        </style>

        {{-- Scripts --}}
        <script>
            window.Laravel = {!! json_encode([
                'csrfToken' => csrf_token(),
            ]) !!};
        </script>

        <script type="text/javascript" src="/js/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="/js/bootstrap.min.js"></script>

        @yield('head')

    </head>
    <body>
        <div id="app" style="min-height:calc(100vh)">
            <div class="col-md-2" style="min-height:calc(100vh);padding:0px;">
            @include('partials.adminnav')
            </div>
            <div class="col-md-10" style="padding:5px;">
                <div class="col-md-12" style="background: #aaa;padding:10px;">
                    <div class="col-md-12" style="background:#fff; border-radius:10px;min-height:calc(100vh - 30px)">
                        @yield('content')
                    </div>
                </div>
            </div>
        </div>

        {{-- Scripts --}}



        @yield('footer_scripts')

    </body>
</html>
