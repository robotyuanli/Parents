@extends('layouts.app')

@section('template_title')
    {{ Auth::user()->name }}'s' Homepage
@endsection

@section('template_fastload_css')

@endsection
<link href="{{ asset('css/schedule.css') }}" rel="stylesheet" />

@section('content')

    <style>
        @media (min-width: 768px){
            .modal-dialog {
                width: 600px ;
                margin: 50px auto !important;
            }
        }
    </style>
    <div class="container">
        <div class="row top-bar" style="background: #00137f; color: white; text-align: center;">
            <div class="col-md-4">
                <h3>Date:{{$today}}</h3>
            </div>
            <div class="col-md-4">
                <h3> Available time solts</h3>
                <h4>Please select a time slot below</h4>
            </div>
            <div class="col-md-4">
                <h3>Teacher: Mrs {{$teacher->first_name}} {{$teacher->last_name}}</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;">

<div class="row">
                    @foreach($schedules as $schedule)
                        <div class="col-md-3 parentslot" style="cursor: pointer;" >
                            <div class="col-md-12 slotitem" onclick="BookingSlot({{$schedule->id}})">
                                <?php
                                if($schedule->app_from/100 > 12){
                                    $app_from = ($schedule->app_from/100) - 12;
                                    $app_from = $app_from.' pm';
                                }else{
                                    $app_from = ($schedule->app_from/100).' am';
                                }
                                if($schedule->app_to/100 > 12){
                                    $app_to = ($schedule->app_to/100) - 12;
                                    $app_to = $app_to.' pm';
                                }else{
                                    $app_to = ($schedule->app_to/100).' am';
                                }
                                ?>
                                <h1 style="font-size: 25px;text-align: center">Mrs {{ $schedule->t_first_name }} {{ $schedule->t_last_name }}</h1>
                                <p style="font-size: 22px;text-align: center">{{ $schedule->workingdate }}</p>
                                <p style="font-size: 22px;text-align: center">{{ $app_from }} - {{ $app_to }}</p>
                                <p style="font-size: 19px;text-align: center">{{ $schedule->t_first_name }} {{ $schedule->t_last_name }}</p>
                                {{--<i class="fa fa-eye fa-graduation-cap delete" onclick="BookingSlot({{$schedule->id}})"></i>--}}

                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>


    <div id="slotModal" class="modal fade" role="dialog" style="top: 120px;" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" style="margin: 50px auto !important">
            <div class="modal-content" >
                <div class="modal-header">
                    <h4 class="modal-title text-center">Booking Schedule</h4>
                </div>
                <div class="modal-body">
                    <div class="plan_template_container">
                        <p>Thank you.</p>
                        <p>You have successfully book schedule!</p>
                    </div>
                    <div class="row">
                        <div class="col-md-10">

                        </div>

                        <div class="col-md-2">
                            <button type="button" id="done_plan_btn" class="btn btn-block btn-bitbucket" style="margin: 5px;" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="confirmModal" class="modal fade" role="dialog" style="top: 120px;" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" style="margin: 50px auto !important">
            <div class="modal-content" >
                <div class="modal-header">
                    <h4 class="modal-title text-center">Booking Schedule</h4>
                </div>
                <div class="modal-body">
                    <div class="plan_template_container">
                        <p>Do you want to book on this schedule?</p>
                        <input type="hidden" id="selected_schedule" value="0"/>
                    </div>
                    <div class="row">
                        <div class="col-md-8">

                        </div>

                    <div class="col-md-2">
                        <button type="button" id="agree_btn" class="btn btn-block btn-bitbucket" style="margin: 5px;" data-dismiss="modal">Yes</button>
                    </div>

                    <div class="col-md-2">
                        <button type="button" id="disagree_btn" class="btn btn-block btn-bitbucket" style="margin: 5px;" data-dismiss="modal">No</button>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
 
@section('footer_scripts')

    <script type="text/javascript">
	$(document).ready(function(){
    $('#agree_btn').click(function(){
        var schedule_id = $('#selected_schedule').val();
        $('#selected_schedule').val(0);

        var data = {};
        data.schedule_id = schedule_id;
        data._token = '{{ csrf_token() }}';

        $.ajax({
            type: "POST",
            url: "{{URL::route("public.home.bookschedule")}}",
            data: data,
            success: function (response) {
                var ret = JSON.parse(response);
                console.log(ret);
                $('#slotModal').modal('show');
            },
            error: function() {

            }
        });

    });
	
	 });

    function BookingSlot(id){
        var url = '{{url('/home/bookslot')}}' + '/' + id;
        console.log(url);
        location.assign(url);
        // $('#selected_schedule').val(id);
        // $('#confirmModal').modal('show');
    };

    $('#done_plan_btn').click(function () {
        location.reload();
    });

    </script>
@endsection
