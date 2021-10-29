@extends('layouts.app')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

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
    .other_assign{
        background: rgb(157, 156, 156);
    }
</style>
@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="padding-top:50px;">
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Slots</h2>
				<h2 style="text-align: center; font-size:30px;font-weight: bold;">Please select a single slot only.</h2>
                <input type="hidden" id="parent_id" name="parent_id" value="{{$user_id}}"/>
                {{-- <input type="hidden" id="parent_id" name="parent_id" value="0"/> --}}
            </div>
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;padding-bottom:50px;">
                <div class="row">
                    @foreach($slots as $slot)
                        <div class="col-md-4 parentslot">
                            <?php
                                $prefix = $slot->prefix;
                                $teacher_name = $slot->t_f_name." ".$slot->t_l_name;

                            $appoint_date = '';

                            $is_deleted = $slot->is_deleted;
                            $appoint_id = $slot->appointment_id;
                            $slot_id = $slot->slot_id;
                            $cls = 'not_assigned';
                            $parent_id = $slot->parent_id;
                            if($is_deleted == 0 && $appoint_id > 0){
                                $cls = 'other_assign';
                                if($parent_id == $user_id){
                                    $cls = 'assigned';
                                }

                                $appoint_date = $slot->appoint_date;
                                if(!empty($appoint_date)){
                                    $appoint_date = date('Y-m-d', strtotime($appoint_date));
                                }
                            }

                          /*  $minutes = $slot->duration * ($slot_id -1);
                            $hour = ($minutes - ($minutes % 60))/60;
                            $start_hour = $slot->app_from + $hour;
                            $half = '';
                            if($start_hour > 12){
                                $start_hour = $start_hour - 12;
                                $half = 'pm';
                            }else{
                                $half = 'am';
                            }
                            $start_minute = $minutes % 60;
                            $start_minute = sprintf("%02d", $start_minute);*/
							
							 if($slot->app_from/100 > 12){
                                $app_from = ($slot->app_from/100) - 12;
                                $app_from = $app_from.' pm';
                            }else{
                                $app_from = ($slot->app_from/100).' am';
                            }
                            if($slot->app_to/100 > 12){
                                $app_to = ($slot->app_to/100) - 12;
                                $app_to = $app_to.' pm';
                            }else{
                                $app_to = ($slot->app_to/100).' am';
                            }

                            $minutes = $slot->duration * ($slot->order -1);
                            $hour = ($minutes - ($minutes % 60))/60;
                            $start_hour = ($slot->app_from/100) + $hour;
                            $half = '';
                            if($start_hour > 12){
                                $start_hour = $start_hour - 12;
                                $half = 'pm';
                            }else{
                                $half = 'am';
                            }
                            $start_minute = $minutes % 60;
                            $start_minute = sprintf("%02d", $start_minute);
							
							
                            ?>
                            <div class="col-md-12 slotitem appoint_box {{$cls}}">

                                <p style="font-size: 22px;">{{ $start_hour }}:{{$start_minute}} {{$half}} - {{$slot->duration}}min</p>
                                <p style="font-size: 19px;">{{$prefix}} {{ $teacher_name }}</p>
                                <p style="font-size: 19px;">Appointment  Date: {{ $appoint_date }}</p>
                                    @if($is_deleted == 0 && $appoint_id > 0 )
                                        @if($parent_id == $user_id)
                                            <i class="fa fa-close delete" onclick="selectDelete({{ $appoint_id }})" data-toggle="modal" data-target="#deletemodal" ></i>
                                        @endif
                                    @else
                                        <i class="fa fa-plus delete"  onclick="selectAdd({{ $slot_id }})" data-toggle="modal" data-target="#addmodal"></i>
                                    @endif
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>
    <div id="deletemodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <p>Do you want really to delete this appointment?</p>
                    
                    <input type="hidden" id="did" value="0">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="color:#fff;background:#f00;" onclick="clickDelete()">Delete</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
                    <input type="hidden" id="aid" value="0">
                    <h4>Assign Slot</h4>
                    <p>Please select the child: </p>
                    <select id="ch_id">
                        @foreach ($childs as $child)
                    <option value="{{$child->id}}">{{$child->full_name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="color:#fff;background:#f00;" onclick="clickAdd()">Yes</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
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
        function selectDelete(id){
            console.log(id);
            $('#did').val(id);
        }
        function clickDelete(){
            var id = $('#did').val();
            jQuery.ajax({
                url: "{{ url('/appointment/delete') }}/"+id,
                method: 'get',
                success: function(result){
                    console.log(result);
                    var ret = JSON.parse(result);
                    var code = ret.code;
                    $('#message').html(ret.msg);
                    $('#confirmmodal').modal('show');
                    if(code == 1){
                        location.reload();
                    }
                }});
        }

        function selectAdd(solt_id) {
            $('#aid').val(solt_id);
        }
        function clickAdd() {
            var id = $('#aid').val();
            var parent_id = $('#parent_id').val();
            var ch_id = $('#ch_id').val();
            console.log(parent_id);
            if(parent_id == 0){
                var message = "Please select Pupil.";
                $('#add_message').html(message);
                $('#addconfirmmodal').modal('show');
                return;
            }

            var data = {};
            data.slot_id = id;
            data.parent_id = parent_id;
            data.ch_id = ch_id;
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
                    location.reload();
                },
                error: function() {

                }
            });
        }
    </script>
@endsection
