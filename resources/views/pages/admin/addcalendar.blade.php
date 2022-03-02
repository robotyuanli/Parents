@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
		<link href="{{ asset('/css/jquery-ui.css') }}" rel="stylesheet">
		<script type="text/javascript" src="{{ asset('/js/jquery-ui.js') }}"></script>
		<script type="text/javascript" src="{{ asset('/js/jquery.validate.min.js') }}"></script>
		
		<div class="title-box d-flex justify-content-center align-items-center">
			<span style="color: white; font-size: 60px; font-weight: bold;">Add Calendar</span>
		</div>
    
		<div class="container">
        <div class="row">
            <div class="col-md-12" style="padding-top:20px;">
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Add Calendar</h2>
            </div>
            <form method="POST" action="{{ route('addcalendar') }}" id="form_add">
                @csrf
            <div class="col-md-12" style="padding-top:20px;">
                <div class="col-md-5 text-right" style="color:#000;font-size:17px;font-weight: bold;">
                    Date
                </div>
                <div class="col-md-7">
                    <input autocomplete="off" type="text" class="form-control" id="calendardate" name="calendardate" style="width:300px;border:2px solid #000;">
                </div>
                @if ($errors->has('app_to'))
                    <span id="error_email" class="invalid-feedback">
                                        <strong>{{ $errors->first('app_to') }}</strong>
                                    </span>
                @endif
            </div>

            <div class="col-md-12" style="padding-top:10px;">
                <div class="col-md-5 text-right" style="color:#000;font-size:17px;font-weight: bold;">
                    Assign Class
                </div>
                <div class="col-md-7">
                    <select class="form-control" id="class_id" name="class_id" style="border:2px solid #000;font-size:17px;color:#000;width:300px;height:40px;" >
                        {{--<option value="0"></option>--}}
                        @foreach($classes as $class)
                            <option value="{{ $class->id }}">{{ $class->name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-md-12" style="padding-top:10px;">
                <div class="col-md-5 text-right" style="color:#000;font-size:17px;font-weight: bold;">
                    Assign Teacher
                </div>
                <div class="col-md-7">
                    <select class="form-control" id="teacher_id" name="teacher_id" style="border:2px solid #000;font-size:17px;color:#000;width:300px;height:40px;" >
                        {{--<option value="0"></option>--}}
                        @foreach($teachers as $teacher)
                            <option value="{{ $teacher->id }}">{{ $teacher->first_name }} {{ $teacher->last_name }}</option>
                        @endforeach
                    </select>
                </div>
            </div>
            <div class="col-md-12" style="padding-top:50px;">
                <div class="col-md-5 text-right" style="color:#000;font-size:17px;font-weight: bold;">
                    Slot Durations
                </div>
                <div class="col-md-7">
                    <select class="form-control" id="duration" name="duration" style="border:2px solid #000;font-size:17px;color:#000;width:200px;height:40px;" >
                        {{--<option value="0"></option>--}}
                        @for($i = 5;$i < 90; $i+=5)
                            <option value="{{ $i }}">{{ $i }} mins</option>
                        @endfor
                    </select>
                </div>
            </div>
            <div class="col-md-12" style="padding-top:10px;">
                <div class="col-md-5 text-right" style="color:#000;font-size:17px;font-weight: bold;">
                    Appointment time frame
                </div>
                <div class="col-md-7">
                    <div class="col-md-4 p-0">
                        <select class="form-control " id="app_from" name="app_from" style="display:inline-block;border:2px solid #000;font-size:17px;color:#000;height:40px;" >
                            {{--<option value="0"></option>--}}
                            @for($i = 12;$i < 22; $i++)
                            @for($j = 0;$j < 60; $j=$j+15)
                                <?php
                                if($i < 13) {$k = ($i*100)+$j;$str = 'am';}
                                else {$k = ($i*100)+$j;$str = 'pm';}
																if($j < 10) {
																	$j = '0'.$j;
																}
                                ?>
                                <option value="{{ $k }}">{{ $i }} : {{ $j }}  {{ $str }}</option>
                                @endfor
                            @endfor
														<?php {$k = ($i*100)+$j;$str = 'pm';} ?>
														<option value="{{ $k }}">{{ $i }} : 00  {{ $str }}</option>
                        </select>
                    </div>
                    <div class="col-md-2 p-0 align-content-center" style="font-size:20px;font-weight: bold;text-align: center;">
                        to
                    </div>
                    <div class="col-md-4 p-0">
                        <select class="form-control " id="app_to" name="app_to" style="display:inline-block;border:2px solid #000;font-size:17px;color:#000;height:40px;" >
                            {{--<option value="0"></option>--}}
                            @for($i = 12;$i < 22; $i++)
                            @for($j = 0;$j < 60; $j=$j+15)
                                <?php
                                if($i < 13) {$k = ($i*100)+$j;$str = 'am';}
                                else {$k = ($i*100)+$j;$str = 'pm';}
																if($j < 10) {
																	$j = '0'.$j;
																}
                                ?>
                                <option value="{{ $k }}">{{ $i }} : {{$j}}  {{ $str }}</option>
                                @endfor
                            @endfor
														<?php {$k = ($i*100)+$j;$str = 'pm';} ?>
														<option value="{{ $k }}">{{ $i }} : 00  {{ $str }}</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-12" style="padding-top:50px;position: absolute;bottom:50px;right:50px;" >
                <div class="col-md-6">
                    &nbsp;
                </div>
                <div class="col-md-6">
                    <div class="col-md-6">
                    </div>
                    <div class="col-md-6">
                        <button type="submit" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                            Add
                        </button>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
    <script>
        $( function() {
            $( "#calendardate" ).datepicker({dateFormat: 'dd-mm-yy'});
        } );

        $.validator.addMethod("greaterThan",
            function (value, element, param) {
                var $otherElement = $(param);
                return parseInt(value, 10) > parseInt($otherElement.val(), 10);
        });

        $.validator.addMethod("slot",
            function (value, element, param) {
                var $otherElement = $(param);
                var fromTo = ( parseInt($('#app_to').val(), 10) - parseInt($('#app_from').val(), 10) ) * 60;
                return value <= fromTo;
                // return parseInt(value, 10) > parseInt($otherElement.val(), 10);
            });
				
				var classSelect = document.getElementById('class_id');
				var teacherSelect = document.getElementById('teacher_id');
				classSelect.onchange = function(e){
						teacherSelect.selectedIndex  = classSelect.selectedIndex
				};
				teacherSelect.onchange = function(e){
						classSelect.selectedIndex  = teacherSelect.selectedIndex
				};

        $("#form_add").validate({
            errorPlacement: function (error, element) {
                element.after(error);
            },
            rules: {
                calendardate:{
                    required:true,
                },
                app_to: {
                    number: true,
                    min: 1,
                    greaterThan: "#app_from"
                },
                duration: {
                    number: true,
                    min: 1,
                    slot: true,
                }
                },
            messages: {
                calendardate: "Please enter this value.",
                app_to: "Start Time should be greater than end time.",
                duration: "Please select correct value."
            }
        });

    </script>
@endsection