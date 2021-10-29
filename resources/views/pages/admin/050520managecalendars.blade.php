@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection
<style>
    .slotitem{
        position: relative;
    }
    .slotitem .delete{
        position:absolute;
        display:none;
        top: 10px;
        right: 10px;
        font-size: 2em;
        color: rgba(247, 12, 12, 0.51);
    }

    .slotitem .view{
        position:absolute;
        display:none;
        top: 10px;
        left: 10px;
        font-size: 2em;
        color: rgba(156, 46, 247, 0.51);
    }
    .slotitem .delete:hover{
        color: #f70c0c;
    }

    .slotitem .view:hover{
        color: rgb(156, 46, 247);
    }

    .slotitem:hover{
        opacity:0.5;
    }
    .slotitem:hover .delete {
        display: block;
    }
    .slotitem:hover .view {
        display: block;
    }
</style>

<link href="{{ asset('css/schedule.css') }}" rel="stylesheet" />

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="padding-top:50px;">
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Manage Calendar</h2>
				<a href="{{ url('/addcalendar') }}">Add New Calendar</a>
            </div>
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;">

                <div class="row">
                    @foreach($schedules as $schedule)
                    <div class="col-md-3 parentslot">
                        <div class="col-md-12 slotitem">
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
                            <p style="font-size: 19px;text-align: center">{{ $schedule->t_f_name }} {{ $schedule->t_first_name }}</p>
                            <i class="fa fa-close delete" onclick="RemoveCalendar({{$schedule->id}});"></i>
                            <i class="fa fa-eye view" onclick="ViewAppointment({{$schedule->id}});"></i>
                        </div>
                    </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    <div id="deleteModal" class="modal fade" role="dialog" style="top: 120px;" data-backdrop="static" data-keyboard="false">
        <div class="modal-dialog" style="margin: 50px auto !important">
            <div class="modal-content" >
                <div class="modal-header">
                    <h4 class="modal-title text-center">Delete Schedule</h4>
                </div>
                <div class="modal-body">
                    <div class="plan_template_container">
                        <p>You have successfully deleted calendar!</p>
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
                    <h4 class="modal-title text-center">Delete Calendar</h4>
                </div>
                <div class="modal-body">
                    <div class="plan_template_container">
                        <p>Do you want to remove this calendar?</p>
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

    <script>

        function RemoveCalendar(id) {
            $('#selected_schedule').val(id);
            $('#confirmModal').modal('show');
        }

        function ViewAppointment(id) {
            var url = '{{url("/calendarappointment/")}}/' + id;
            location.assign(url);
        }

        $('#done_plan_btn').click(function () {
            location.reload();
        });
        $('#agree_btn').click(function(){
            var schedule_id = $('#selected_schedule').val();
            $('#selected_schedule').val(0);

            var data = {};
            data.schedule_id = schedule_id;
            data._token = '{{ csrf_token() }}';

            $.ajax({
                type: "POST",
                url: "{{URL::route("deletecalendar")}}",
                data: data,
                success: function (response) {
                    var ret = JSON.parse(response);
                    console.log(ret);
                    $('#deleteModal').modal('show');
                },
                error: function() {

                }
            });

        });

    </script>
@endsection
