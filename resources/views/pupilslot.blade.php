@extends('layouts.parentapp')

@section('head')
@endsection
<link href="{{ asset('css/schedule.css') }}" rel="stylesheet" />
<style>
    .appoint_box{
        padding: 3em 1em 2em 2em;
    }
    .not_assigned{
        background: rgba(179, 255, 202, 0.53);
    }
    .assigned{
        background: rgba(236, 161, 107, 0.33);
    }
</style>
@section('content')
    <div class="container">
        <div class="row">
					<div class="col-md-12" style="padding-top:20px;">
                <h2 style="text-align: center; font-size:25px;font-weight: bold; text-align: left;">Date: {{$workingdate}}</h2>
            </div>
            <div class="col-md-12">
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Slots</h2>
            </div>
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;padding-bottom:50px;">
                <div class="row">
                    @foreach($slots as $slot)
                        <div class="col-md-6 parentslot">
                            <?php
                            $prefix = $slot->prefix;
                            $teacher_name = $slot->t_first_name . " " . $slot->t_last_name;
                            $parent_name = '';
                            $parent_email = '';
                            $child_name = '';
                            $appoint_date = '';

                            $is_deleted = $slot->is_deleted;
                            $appoint_id = $slot->appointment_id;
                            $slot_id = $slot->slot_id;
                            $cls = 'not_assigned';
                            if($is_deleted == 0 && $appoint_id > 0){
                                $cls = 'assigned';
                                $parent_name = $slot->first_name." ".$slot->last_name;
                                $parent_email = $slot->email;
                                $child_name = $slot->ch_f_name." ".$slot->ch_l_name;
                                $appoint_date = $slot->appoint_date;
                                if(!empty($appoint_date)){
                                    $appoint_date = date('Y-m-d', strtotime($appoint_date));
                                }
                            }

														if($slot->app_from%100 == 0) {
															$rest = '00';
														}
														else if ($slot->app_from%100 < 10) {
															$rest = '0'.$slot->app_from%100;
														}
														else {
															$rest = $slot->app_from%100;
														}
                            if($slot->app_from/100 > 12){
                                $app_from = (($slot->app_from - $slot->app_from%100)/100).'.'. $rest.' pm';
                            }else{
                                $app_from = (($slot->app_from - $slot->app_from%100)/100).'.'. $rest.' am';
                            }
														
														if($slot->app_to%100 == 0) {
															$rest = '00';
														}
														else if ($slot->app_to%100 < 10) {
															$rest = '0'.$slot->app_to%100;
														}
														else {
															$rest = $slot->app_to%100;
														}
														if($slot->app_to%100 == 0) {
															$rest = '00';
														}
														else if ($slot->app_to%100 < 10) {
															$rest = '0'.$slot->app_to%100;
														}
														else {
															$rest = $slot->app_to%100;
														}

                            if($slot->app_to/100 > 12){
                                $app_to = (($slot->app_to - $slot->app_to%100)/100).'.'. $rest.' pm';
                            }else{
                                $app_to = (($slot->app_to - $slot->app_to%100)/100).'.'. $rest.' am';
                            }
                            
                            $minutes = $slot->app_from%100 + $slot->duration * ($slot->order -1);
                            if($minutes >= 60 && $minutes % 60 == 0) {
                                $hour = $minutes / 60;
                            }
                            else {
                                $hour = ($minutes - ($minutes % 60))/60;
                            }                            
                            $start_hour = ($slot->app_from - $slot->app_from%100)/100 + $hour;
                            $half = '';
                            if($start_hour > 12){
                                $half = 'pm';
                            }else{
                                $half = 'am';
                            }
                            $start_minute = $minutes % 60;
                            $start_minute = sprintf("%02d", $start_minute);

                            ?>
                                <div class="col-md-12 slotitem appoint_box {{$cls}}">
                                    <p style="font-size: 22px;">{{$prefix}} {{ $teacher_name }}</p>
                                    <p style="font-size: 22px;">{{ $app_from }} - {{ $app_to }} ,  {{ $start_hour }}:{{$start_minute}} {{$half}} - {{$slot->meeting_time}}min</p>
                                    <p style="font-size: 22px;">Parent Name: {{ $parent_name }}</p>
                                <p style="font-size: 22px;">Parent Email: {{ $parent_email }}</p>
                                <p style="font-size: 19px;">Child Name: {{ $child_name }}</p>
                                <p style="font-size: 19px;">Appointment Date: {{ $appoint_date }}</p>
                                @if(!($is_deleted == 0 && $appoint_id > 0))
                                  <i class="fa fa-plus delete"  onclick="selectAdd({{ $slot_id }})" data-toggle="modal" data-target="#addmodal"></i>
                                @endif
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    
    <div id="confirmmodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <p id="message"></p>
                    <input type="hidden" id="did" value="0">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <div id="addmodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body m-3">
                    <input type="hidden" id="slot_id" value="0">
                    <input type="hidden" id="parent_id" value="{{$children[0]->p_id}}">
                    <h4>Assign Slot</h4>
                    <label>Pupil</label>
                    <select class="form-control" id="c_id" name="c_id" style="height: 35px;">
                        @foreach($children as $ch)
                            <option value="{{$ch->id}}">{{$ch->first_name}} {{$ch->last_name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="color:#fff;background:#f00;" onclick="clickAdd()">Add</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                </div>
            </div>

        </div>
    </div>
    <div id="addconfirmmodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <p id="add_message"></p>
                    <input type="hidden" id="did" value="0">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <script>
				$('#c_id').on('change', function (e) {
					var index = e.target.selectedIndex;
					var children = {!! $children !!};
					$('#parent_id').val(children[index].p_id);
				});
        function selectAdd(slot_id) {
            $('#slot_id').val(slot_id);
        }
        function clickAdd() {
            var c_id = $('#c_id').val();
            var slot_id = $('#slot_id').val();
						var parent_id = $('#parent_id').val();
            if(parent_id == 0){
                var message = "Please select Pupil.";
                $('#add_message').html(message);
                $('#addconfirmmodal').modal('show');
                return;
            }

            var data = {};
            data.c_id = c_id;
            data.slot_id = slot_id;
            data.parent_id = parent_id;
            data._token = '{{ csrf_token() }}';

            $.ajax({
                type: "POST",
                url: "{{URL::route("public.home.bookschedule")}}",
                data: data,
                success: function (response) {
                    var ret = JSON.parse(response);
                    console.log(ret);
                    $('#add_message').html(ret.msg);

                    $('#addconfirmmodal').modal('show');
										window.location.reload(true);
                },
                error: function() {

                }
            });
        }
    </script>
@endsection
