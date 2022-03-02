@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <script type="text/javascript" src="/js/jquery-2.1.1.js"></script>
    <script type="text/javascript" src="/js/jquery-ui.js"></script>
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="padding-top:50px;">
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Edit Parent</h2>
            </div>
            <form method="POST" action="{{ route('editparent') }}">
                @csrf
                <input type="hidden" name="id" value="{{ $parent->id }}">
                <div class="form-group col-md-6">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left">Forename *</label>

                    <div class="col-md-12">
                        <input id="first_name" type="text" class="form-control{{ $errors->has('first_name') ? ' is-invalid' : '' }}" name="first_name" value="{{ $parent->first_name }}" required autofocus>

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
                        <input id="last_name" type="text" class="form-control{{ $errors->has('last_name') ? ' is-invalid' : '' }}" name="last_name" value="{{ $parent->last_name }}" required autofocus>

                        @if ($errors->has('last_name'))
                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('last_name') }}</strong>
                                    </span>
                        @endif
                    </div>
                </div>

 		 						<div class="form-group col-md-6">
                    <label for="last_name" class="col-md-12 col-form-label text-md-left">Password *</label>

                    <div class="col-md-12">
                        <input id="password" type="password" class="form-control" name="password" value="">
                    </div>
                </div>

								<div class="form-group col-md-6">
                    <label for="last_name" class="col-md-12 col-form-label text-md-left">Email</label>

                    <div class="col-md-12">
                        <input id="email" type="text" class="form-control" name="email" value="{{ $parent->email }}" required autofocus>
                    </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="c_first_name" class="col-md-12 col-form-label text-md-left">Childs Forename</label>

                    <div class="col-md-12">
                        <input id="c_first_name" type="text" class="form-control{{ $errors->has('c_first_name') ? ' is-invalid' : '' }}" name="c_first_name" value="{{ $parent->c_first_name }}"  >

                        @if ($errors->has('c_first_name'))
                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('c_first_name') }}</strong>
                                    </span>
                        @endif
                    </div>
                </div>

                <div class="form-group col-md-6">
                    <label for="c_last_name" class="col-md-12 col-form-label text-md-left">Surname</label>

                    <div class="col-md-12">
                        <input id="c_last_name" type="text" class="form-control{{ $errors->has('c_last_name') ? ' is-invalid' : '' }}" name="c_last_name" value="{{ $parent->c_last_name }}"  >

                        @if ($errors->has('c_last_name'))
                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('c_last_name') }}</strong>
                                    </span>
                        @endif
                    </div>
                </div>

                <div class="form-group col-md-12">
                    <label for="class_id" class="col-md-12 col-form-label text-md-left">Childs Class</label>

                    <div class="col-md-12">
                        <?php
                        $classes = \DB::table('classes')->get();
                        ?>
                        <select id="class_id" name="class_id" class="form-control" style="height:34px;">
                            <option value="0" ></option>
                            @foreach($classes as $class)
                                <option value="{{ $class->id }}" @if($parent->class_id  == $class->id ) selected @endif>{{ $class->name }}</option>
                            @endforeach
                        </select>
                        @if ($errors->has('class_id'))
                            <span class="invalid-feedback">
                                        <strong>{{ $errors->first('class_id') }}</strong>
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
                                Update Parent
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
            location.href = "{{ url('/manageparents') }}";
        }
    </script>
@endsection
