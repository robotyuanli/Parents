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
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Schedule of Teacher ({{$teacher->name}} {{$teacher->first_name}} {{$teacher->last_name}})</h2>
            </div>
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;">

                <div class="row">
                    @foreach($schedules as $schedule)
                        <div class="col-md-3 parentslot">
                            <div class="col-md-12 slotitem" >
                                <a href="{{ url('/calendar/parent/') }}/{{$schedule->id}}">
                                    <?php
                                    if($schedule->app_from%100 == 0) {
                                        $rest = '00';
                                    }
                                    else if ($schedule->app_from%100 < 10) {
                                        $rest = '0'.$schedule->app_from%100;
                                    }
                                    else {
                                        $rest = $schedule->app_from%100;
                                    }

                                    if($schedule->app_from/100 > 12){
                                        $app_from = (($schedule->app_from - $schedule->app_from%100)/100).'.'. $rest. ' pm';
                                    }else{
                                            $app_from = (($schedule->app_from - $schedule->app_from%100)/100).'.'. $rest. ' am';
                                    }

                                    if($schedule->app_to%100 == 0) {
                                        $rest = '00';
                                    }
                                    else if ($schedule->app_to%100 < 10) {
                                        $rest = '0'.$schedule->app_to%100;
                                    }
                                    else {
                                        $rest = $schedule->app_to%100;
                                    }

                                    if($schedule->app_to/100 > 12){
                                            $app_to = (($schedule->app_to - $schedule->app_to%100)/100).'.'. $rest. ' pm';
                                    }else{
                                            $app_to = (($schedule->app_to - $schedule->app_to%100)/100).'.'. $rest .' am';
                                    }
                                    ?>
                                    <h1 style="font-size: 25px;text-align: center"><?php if($schedule->prefix==1) echo "Mr";if($schedule->prefix==2) echo "Mrs";if($schedule->prefix==3) echo "Miss";if($schedule->prefix==4) echo "Ms";?> {{ $schedule->t_first_name }}</h1>
                                    <p style="font-size: 22px;text-align: center">{{ $schedule->workingdate }}</p>
                                    <p style="font-size: 22px;text-align: center">{{ $app_from }} - {{ $app_to }}</p>
                                    <p style="font-size: 19px;text-align: center">{{ $schedule->t_first_name }} {{ $schedule->t_last_name }}</p>
                                </a>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
@endsection
