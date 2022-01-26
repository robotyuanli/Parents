@extends('layouts.app')

@section('content')
    <div class="col-md-6" style="padding:0px;">
        <img src="/images/pexels-photo-164531.jpeg" style="width:100%;height:auto;">
        <p style="color:#0076ff;text-align: center;font-size:20px;">Please fill in the form opposite to request account information.</p>
    </div>
    <div class="col-md-6" style="padding:0px;background-color:#0076ff;min-height:calc(100vh - 120px);padding-top:100px;">
        <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">

                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <div class="form-group col-md-6">
                            <label for="first_name" class="col-md-12 col-form-label text-md-left">Forename *</label>

                            <div class="col-md-12">
                                <input id="first_name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="first_name" value="{{ old('first_name') }}" required autofocus>
                                @if ($errors->has('name'))
                                    <span id="error_email" class="invalid-feedback">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="last_name" class="col-md-12 col-form-label text-md-left">Surname *</label>

                            <div class="col-md-12">
                                <input id="last_name" type="text" class="form-control{{ $errors->has('name') ? ' is-invalid' : '' }}" name="last_name" value="{{ old('last_name') }}" required autofocus>

                                @if ($errors->has('name'))
                                    <span id="error_email" class="invalid-feedback">
                                        <strong>{{ $errors->first('name') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>
                        <input id="name" type="text" name="name" value="" style="position:absolute; top:-1000px">

                        <div class="form-group col-md-12">
                            <label for="email" class="col-md-12 col-form-label text-md-left">Parent email address *</label>

                            <div class="col-md-12">
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required>
                                @if ($errors->has('email'))
                                    <span id="error_email" class="invalid-feedback">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif

                            </div>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="password" class="col-md-12 col-form-label text-md-left">{{ __('Password') }} *</label>

                            <div class="col-md-12">
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group col-md-12">
                            <label for="password-confirm" class="col-md-12 col-form-label text-md-left">{{ __('Confirm Password') }} *</label>

                            <div class="col-md-12">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                            </div>
                        </div>

                        <div class="form-group col-md-6">
                            <label for="c_first_name" class="col-md-12 col-form-label text-md-left">Childs Forename</label>

                            <div class="col-md-12">
                                <input id="c_first_name" type="text" class="form-control{{ $errors->has('c_first_name') ? ' is-invalid' : '' }}" name="c_first_name" value="{{ old('c_first_name') }}"  >

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
                                <input id="c_last_name" type="text" class="form-control{{ $errors->has('c_last_name') ? ' is-invalid' : '' }}" name="c_last_name" value="{{ old('c_last_name') }}"  >

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
                                    <option value="{{ $class->id }}" @if(old('class_id') == $class->id ) selected @endif>{{ $class->name }}</option>
                                    @endforeach
                                </select>
                                @if ($errors->has('class_id'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('class_id') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group col-md-12" style="padding-top:20px;">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary" id="btn_register" style="width:100%;border-radius: 50px;border:1px solid white;background-color: transparent">
                                    {{ __('Register') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection

@section('footer_scripts')
    @if(config('settings.reCaptchStatus'))
        <script src='https://www.google.com/recaptcha/api.js'></script>
    @endif
    <script>

        $('#last_name').change(function () {
            var first = $('#first_name').val();
            var last = $('#last_name').val();
            $('#name').val(last + first);
        });

        $('#first_name').change(function () {
            var first = $('#first_name').val();
            var last = $('#last_name').val();
            $('#name').val(last + first);
        });

    </script>
@endsection
