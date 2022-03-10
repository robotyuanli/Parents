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
				<div class="col-md-6">
						<h3> Available time solts</h3>
				</div>
				<div class="col-md-6">
						<h3>Teacher: <?php if($schedule->prefix==1) echo "Mr";if($schedule->prefix==2) echo "Mrs";if($schedule->prefix==3) echo "Miss";if($schedule->prefix==4) echo "Ms";?> {{$teacher->first_name}} {{$teacher->last_name}}</h3>
				</div>
			</div>
			<div class="row">
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;">

				<div class="row">
                    @foreach($schedules as $schedule)
                        <div class="col-md-3 parentslot" style="cursor: pointer;" >
                            <div class="col-md-12 slotitem">
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
								<h1 style="font-size: 25px;text-align: center"><?php if($schedule->prefix==1) echo "Mr";if($schedule->prefix==2) echo "Mrs";if($schedule->prefix==3) echo "Miss";if($schedule->prefix==4) echo "Ms";?> {{ $schedule->te_firstname }} {{ $schedule->te_lastname }}</h1>
								<p style="font-size: 22px;text-align: center">{{ $schedule->workingdate }}</p>
								<p style="font-size: 22px;text-align: center">{{ $app_from }} - {{ $app_to }}</p>
                                <p style="font-size: 19px;text-align: center">{{ $schedule->first_name }} {{ $schedule->last_name }}</p>
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
