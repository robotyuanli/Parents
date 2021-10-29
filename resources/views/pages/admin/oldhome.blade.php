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
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Admin Panel</h2>
            </div>
            <div class="col-md-12" style="padding-top:50px;">
                <div class="col-md-4">
                    <a href="{{ url('/import/class') }}" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                        Import Class
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="{{ url('/pupil/add') }}" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                        Add Pupil
                    </a>
                </div>
                <div class="col-md-4">
                    &nbsp;
                </div>
            </div>
            <div class="col-md-12" style="padding-top:50px;">
                <div class="col-md-4">
                    <a href="{{ url('/') }}/addcalendar" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                        Add Calendar
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="{{ url('/teacher/add') }}" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                        Add Teacher
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="{{ url('/manageusers') }}" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                        Manage Users
                    </a>
                </div>
            </div>
            <div class="col-md-12" style="padding-top:50px;">
                <div class="col-md-4">
                    <a href="{{ url('/managecalendars') }}" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                        Manage Calendars
                    </a>
                </div>
                <div class="col-md-4">
                    &nbsp;
                </div>
                <div class="col-md-4">
                    &nbsp;
                </div>
            </div>
            <div class="col-md-12" style="padding-top:50px;position: absolute;bottom:50px;right:50px;">
                <div class="col-md-6">
                    &nbsp;
                </div>
                <div class="col-md-6">
                    <div class="col-md-6">
                        <a href="" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                            Back Up
                        </a>
                    </div>
                    <div class="col-md-6">
                        <a href="" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                            Restore
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection
