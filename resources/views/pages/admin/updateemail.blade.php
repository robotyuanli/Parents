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

		<div class="title-box d-flex justify-content-center align-items-center">
			<span style="color: white; font-size: 60px; font-weight: bold;">Email Update</span>
		</div>

    <div class="container">
        <div class="row">
					<form method="POST" action="{{ route('updateemail') }}">
						@csrf
						<div class="form-group col-md-12" style="padding-top:50px;">
								<label for="last_name" class="col-md-12 col-form-label text-md-left">Content *</label>
								<div class="col-md-12">
										<textarea style="width:70vw; height: 150px" id="content" name="content">{{ $content }}</textarea>
								</div>
						</div>
						<div class="col-md-12" style="padding-top:50px;position: absolute;bottom:50px;right:50px;" >
                    <div class="col-md-9">
                        &nbsp;
                    </div>
                    <div class="col-md-3">
												<button type="submit" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
														Update Email
												</button>
                    </div>
                </div>
					</form>
        </div>
    </div>

    <script>
			
    </script>
@endsection
