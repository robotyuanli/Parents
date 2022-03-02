@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
		<link href="{{ asset('/css/jquery-ui.css') }}" rel="stylesheet">
		<script type="text/javascript" src="{{ asset('/js/jquery-ui.js') }}"></script>

		<div class="title-box d-flex justify-content-center align-items-center">
			<span style="color: white; font-size: 60px; font-weight: bold;">Add Single Pupil to Class</span>
		</div>

    <div class="container">
        <div class="row">
            <div class="col-md-12" style="padding-top:50px;">
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Add Pupil</h2>
            </div>
            <form method="POST" action="{{ route('addpupil') }}">
                @csrf
                <div class="form-group col-md-6">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left">Forename*</label>

                    <div class="col-md-12">
                        <input id="first_name" type="text" class="form-control{{ $errors->has('first_name') ? ' is-invalid' : '' }}" name="first_name" value="{{ old('first_name') }}" required autofocus>

                        @if ($errors->has('first_name'))
                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('first_name') }}</strong>
                                    </span>
                        @endif
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label for="last_name" class="col-md-12 col-form-label text-md-left">Surname *</label>

                    <div class="col-md-12">
                        <input id="last_name" type="text" class="form-control{{ $errors->has('last_name') ? ' is-invalid' : '' }}" name="last_name" value="{{ old('last_name') }}" required autofocus>

                        @if ($errors->has('last_name'))
                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('last_name') }}</strong>
                                    </span>
                        @endif
                    </div>
                </div>


                <div class="form-group col-md-12">
                    <label for="class_id" class="col-md-12 col-form-label text-md-left">Pupil Class</label>

                    <div class="col-md-12">
                        <select id="class_id" name="class_id" class="form-control" style="height:34px;">
                            <option value="0" ></option>
                            @foreach($classes as $class)
                                <option value="{{ $class->id }}">{{ $class->name }}</option>
                            @endforeach
                        </select>
                        @if ($errors->has('class_id'))
                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('class_id') }}</strong>
                                    </span>
                        @endif
                    </div>

                    
                </div>

                <div class="form-group col-md-12">
                    <label for="class_id" class="col-md-12 col-form-label text-md-left">Parent</label>
                    <div class="col-md-12">
                        <select id="parent_id" name="parent_id" class="form-control" style="height:34px;">
                            <option value="0" ></option>
                            @foreach($parents as $parent)
                                <option value="{{ $parent->id }}">{{ $parent->first_name }} {{ $parent->last_name }}</option>
                            @endforeach
                        </select>
                        @if ($errors->has('parent_id'))
                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('parent_id') }}</strong>
                                    </span>
                        @endif
                    </div>
                </div>
                

                <div class="col-md-12" style="padding-top:50px;position: absolute;bottom:50px;right:50px;" >
                    <div class="col-md-6">
                        &nbsp;
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <button onclick="returnParent()" type="submit" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00093a;padding:15px 0px;border-radius: 7px;text-decoration: none">
                                Return
                            </button>
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
            $( "#calendardate" ).datepicker();
        } );
        function returnParent(){
            location.href = "{{ url('/managepupils/0') }}";
        }
    </script>
@endsection
