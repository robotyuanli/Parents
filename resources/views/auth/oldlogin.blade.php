@extends('layouts.app')

@section('content')
    <div class="col-md-6" style="padding:0px;">
        <img src="/images/pexels-photo-164531.jpeg" style="width:100%;height:auto;">
    </div>
    <div class="col-md-6" style="padding:0px;background-color:#0076ff;min-height:calc(100vh - 120px);padding-top:100px;">
        <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">

                <div class="card-body">
                    <form method="POST" action="{{ route('login') }}">
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
                                <button type="submit" class="btn btn-primary" style="width:100%;border-radius: 50px;border:1px solid white;background-color: transparent">
                                    {{ __('Login') }}
                                </button>

                            </div>
                        </div>
                        <div class="form-group row mb-4">
                            <div class="col-md-6">
                                <a class="btn btn-link" href="{{ route('password.request') }}">
                                    {{ __('Forgot Your Password?') }}
                                </a>

                            </div>
                            <div class="col-md-6 text-md-right">
                                <a class="btn btn-link" href="{{ route('register') }}">
                                   Register
                                </a>

                            </div>
                        </div>



                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection
