@extends('layouts.app')

@section('template_title')
    {{ Auth::user()->name }}'s' Homepage
@endsection

@section('template_fastload_css')
@endsection
<link href="{{ asset('css/schedule.css') }}" rel="stylesheet" />
<style>
    @media (min-width: 768px){
        .modal-dialog {
            width: 600px ;
            margin: 50px auto !important;
        }
    }
</style>
@section('content')

    <div class="container" style="margin-top:50px;">
        <div class="row">
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;">

                <div class="row" style="cursor: pointer;">
                    @foreach($bookslots as $slot)
                        <div class="col-md-3 parentslot">
                            <div class="col-md-12 slotitem">
                                <?php
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
                                <h1 style="font-size: 25px;text-align: center">{{$slot->t_prefix}} {{ $slot->t_first_name }}</h1>
                                <p style="font-size: 22px;text-align: center">{{ $slot->workingdate }}</p>
                                    <p style="font-size: 22px;text-align: center">{{ $app_from }} - {{ $app_to }}</p>
                                    <p style="font-size: 22px;text-align: center">{{ $start_hour }}:{{$start_minute}} {{$half}} - {{$slot->duration}}min</p>
                                <i class="fa fa-close delete" onclick="selectDelete({{ $slot->appointment_id }})" data-toggle="modal" data-target="#deletemodal"></i>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    <div id="deletemodal" class="modal fade" role="dialog" style="top: 120px;" >
        <div class="modal-dialog" style="margin: 50px auto !important">

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
                {{--<div class="modal-footer">--}}
                    {{--<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>--}}
                {{--</div>--}}
            </div>

        </div>
    </div>
@endsection
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
</script>
@section('footer_scripts')
@endsection
