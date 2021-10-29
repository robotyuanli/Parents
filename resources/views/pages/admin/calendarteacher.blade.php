@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="padding-top:50px;">
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Schedule of Teacher({{$teacher->name}} {{$teacher->full_name}})</h2>
            </div>
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;">

                <div class="row">
                    @foreach($schedules as $schedule)
                        <div class="col-md-3 parentslot">
                            <div class="col-md-12 slotitem" >
                                <a href="{{ url('/calendar/parent/') }}/{{$schedule->id}}">
                                    <?php
                                    if($schedule->app_from > 12){
                                        $app_from = $schedule->app_from - 12;
                                        $app_from = $app_from.' pm';
                                    }else{
                                        $app_from = $schedule->app_from.' am';
                                    }
                                    if($schedule->app_to > 12){
                                        $app_to = $schedule->app_to - 12;
                                        $app_to = $app_to.' pm';
                                    }else{
                                        $app_to = $schedule->app_to.' am';
                                    }
                                    ?>
                                    <h1 style="font-size: 25px;text-align: center">Mrs {{ $schedule->t_first_name }}</h1>
                                    <p style="font-size: 22px;text-align: center">{{ $schedule->workingdate }}</p>
                                    <p style="font-size: 22px;text-align: center">{{ $app_from }} - {{ $app_to }}</p>
                                    <p style="font-size: 19px;text-align: center">{{ $schedule->t_full_name }}</p>
                                </a>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
