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
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Add Parent</h2>
            </div>
			<div class="col-lg-12">
			 <?php if(Session::has('flash_notice') || Session::has('flash_error')){?>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<?php if(Session::has('flash_notice')){?>
					<div class="alert col-md-12 alert-success">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<?php echo Session::get('flash_notice');?>
					</div>
					<?php }?>
					<?php if(Session::has('flash_error')){?>
					<div class="alert col-md-12 alert-danger">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<?php if(Session::has('flash_error')) echo Session::get('flash_error').'<br>';?>
					</div>                
					<?php }?>
				</div>
			</div>
		</div>
		<?php }?>
            <form method="post" action="{{ url('parent/addparent1') }}">
			  @csrf
			  <div class="form-group col-md-6">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left">Forename *</label>

                    <div class="col-md-12">
                        <input id="first_name" type="text" class="form-control" name="first_name" value="" required >
                    </div>
					
                </div>
				 <div class="form-group col-md-6">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left">Surname *</label>

                    <div class="col-md-12">
                        <input id="last_name" type="text" class="form-control" name="last_name" value="" required >
                    </div>
					
                </div>
				
				<div class="form-group col-md-12">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left">Email *</label>

                    <div class="col-md-12">
                        <input id="email" type="email" class="form-control" name="email" value="" required >
						
                    </div>
					
                </div>
				
				<div class="form-group col-md-12">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left">Password *</label>

                    <div class="col-md-12">
                        <input id="password" type="password" class="form-control" name="password" value="" required >
                    </div>
					
                </div>
				
				
			  <div class="form-group col-md-6">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left">Childs Forename *</label>

                    <div class="col-md-12">
                        <input id="c_first_name" type="text" class="form-control" name="c_first_name" value="" required >
                    </div>
					
                </div>
				 <div class="form-group col-md-6">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left">Surname *</label>

                    <div class="col-md-12">
                        <input id="c_last_name" type="text" class="form-control" name="c_last_name" value="" required >
                    </div>
					
                </div>
				
				
				<div class="form-group col-md-12">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left">Child Class *</label>

                    <div class="col-md-12">
                         <?php
                                $classes = \DB::table('classes')->get();
                                ?>
                                <select id="class_id" name="class_id" class="form-control" style="height:34px;" required>
                                    <option value="" >Select Class</option>
                                    @foreach($classes as $class)
                                    <option value="{{ $class->id }}" @if(old('class_id') == $class->id ) selected @endif>{{ $class->name }}</option>
                                    @endforeach
                                </select>
                    </div>
					
                </div>
				
				<div class="form-group col-md-12">
                    <label for="first_name" class="col-md-12 col-form-label text-md-left"></label>

                    <div class="col-md-12">
                        <button type="submit" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                            Add Parent
                        </button>
                    </div>
					
                </div>
				
				
			</form>
			</div>
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
