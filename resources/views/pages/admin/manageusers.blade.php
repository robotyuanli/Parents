@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
		<div class="title-box d-flex justify-content-center align-items-center">
			<span style="color: white; font-size: 60px; font-weight: bold;">Manage Users</span>
		</div>

		<div class="container" style="padding: 20px 50px">
			<div class="d-flex button-row">
				<div id="manageparents" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #f44336;">
					<a id="go_manageparents" style="text-align: center" href="{{ url('/manageparents') }}">
						<span class="button-title">Manage Parents</span>
					</a>
				</div>
				<div class="space"></div>
				<div id="manageteachers" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #2196f3;">
					<a id="go_manageteachers" style="text-align: center" href="{{ url('/manageteachers') }}">
						<span class="button-title">Manage Teachers</span>
					</a>
				</div>
				<div class="space"></div>
				<div id="managepupils" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #009688;">
					<a id="go_managepupils" style="text-align: center" href="{{ url('/managepupils/0') }}">
						<span class="button-title">Manage Pupils</span>
					</a>
				</div>
				<div class="space"></div>
				<div id="manageadmin" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #ff9800;">
					<a id="go_manageadmin" style="text-align: center" href="{{ url('/users') }}">
						<span class="button-title">Manage Admin</span>
					</a>
				</div>
			</div>
	</div>
	<script>
		document.getElementById("manageparents").onclick = function() {
			document.getElementById("go_manageparents").click();
		};
		document.getElementById("manageteachers").onclick = function() {
			document.getElementById("go_manageteachers").click();
		};
		document.getElementById("managepupils").onclick = function() {
			document.getElementById("go_managepupils").click();
		};
		document.getElementById("manageadmin").onclick = function() {
			document.getElementById("go_manageadmin").click();
		};
	</script>
@endsection
