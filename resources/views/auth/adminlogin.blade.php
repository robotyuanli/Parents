@extends('layouts.loginapp')

@section('content')
    <div class="col-md-12" style="padding:0px;height:calc(50vh);background-color:#0076ff;">
    </div>
    <div class="col-md-12" style="padding:0px;min-height:calc(50vh);background-color:#fff;">
    </div>
    <div class="col-md-12" style="position:absolute;top:calc(25vh)">
        <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card admincard" style="background-color: #fff;border:1px solid #999;">
                <h2 style="text-align: center;font-weight: bold;">Admin Panel</h2>
                <div class="admincard-body col-md-12">
                    <form method="POST" action="{{ route('adminlogin') }}">
                        @csrf

                        <div class="form-group row">
                            <label for="email" class="col-sm-12 col-form-label text-md-left">Email Address *</label>

                            <div class="col-md-12">
                                <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <label for="password" class="col-md-12 col-form-label text-md-left">{{ __('Password') }}</label>

                            <div class="col-md-12">
                                <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> {{ __('Remember Me') }}
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row mb-4">
                            <div class="col-md-12">
                                <button type="submit" class="btn btn-primary" style="width:100%;border-radius: 0px;background-color: #ea4c89;">
                                    {{ __('Login') }}
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
