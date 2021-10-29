@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
  <div class="title-box d-flex justify-content-center align-items-center">
		<span style="color: white; font-size: 60px; font-weight: bold;">Class Parent Links Panel</span>
  </div>
	<div class="container mt-5" style="padding: 20px 50px">
		<div class="d-flex mb-3">
			<div class="flex-grow-1 justfiy-content-center align-items-center" style="width: 100%; text-align: center;">
				<div><span style="font-size: 20px; font-weight: bold;">Year 3</span></div>
			</div>
			<div class="flex-grow-1 justfiy-content-center align-items-center" style="width: 100%; text-align: center;">
				<div><span style="font-size: 20px; font-weight: bold;">Year 4</span></div>
			</div>
			<div class="flex-grow-1 justfiy-content-center align-items-center" style="width: 100%; text-align: center;">
				<div><span style="font-size: 20px; font-weight: bold;">Year 5</span></div>
			</div>
			<div class="flex-grow-1 justfiy-content-center align-items-center" style="width: 100%; text-align: center;">
				<div><span style="font-size: 20px; font-weight: bold;">Year 6</span></div>
			</div>
		</div>

		<div class="d-flex button-row">
			<div id="Parks" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #f44336;">
				<a id="go_Parks" href="{{ url('/manage/Parks') }}">
					<span class="button-title">Parks</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="Pankhurst" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #2196f3;">
				<a id="go_Pankhurst" href="{{ url('/manage/Pankhurst') }}">
					<span class="button-title">Pankhurst</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="Mandela" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #009688;">
				<a id="go_Mandela" href="{{ url('/manage/Mandela') }}">
					<span class="button-title">Mandela</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="Rowling" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #ff9800;">
				<a id="go_Rowling" href="{{ url('/manage/Rowling') }}">
					<span class="button-title">Rowling</span>
				</a>
			</div>
		</div>

		<div class="d-flex button-row mt-5">
			<div id="Churchill" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #f44336;">
				<a id="go_Churchill" href="{{ url('/manage/Churchill') }}">
					<span class="button-title">Churchill</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="Chanel" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #2196f3;">
				<a id="go_Chanel" href="{{ url('/manage/Chanel') }}">
					<span class="button-title">Chanel</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="Attenborough" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #009688;">
				<a id="go_Attenborough" href="{{ url('/manage/Attenborough') }}">
					<span class="button-title">Attenborough</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="Shakespeare" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #ff9800;">
				<a id="go_Shakespeare" href="{{ url('/manage/Shakespeare') }}">
					<span class="button-title">Shakespeare</span>
				</a>
			</div>
		</div>

		<div class="d-flex button-row mt-5">
			<div id="Nightingale" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #f44336;">
				<a id="go_Nightingale" href="{{ url('/manage/Nightingale') }}">
					<span class="button-title">Nightingale</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="Einstein" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #2196f3;">
				<a id="go_Einstein" href="{{ url('/manage/Einstein') }}">
					<span class="button-title">Einstein</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="Curie" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #009688;">
				<a id="go_Curie" href="{{ url('/manage/Curie') }}">
					<span class="button-title">Curie</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="Newton" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #ff9800;">
				<a id="go_Newton" href="{{ url('/manage/Newton') }}">
					<span class="button-title">Newton</span>
				</a>
			</div>
		</div>
	</div>
	<script>
		document.getElementById("Parks").onclick = function() {
			document.getElementById("go_Parks").click();
		};
		document.getElementById("Churchill").onclick = function() {
			document.getElementById("go_Churchill").click();
		};
		document.getElementById("Nightingale").onclick = function() {
			document.getElementById("go_Nightingale").click();
		};
		document.getElementById("Pankhurst").onclick = function() {
			document.getElementById("go_Pankhurst").click();
		};
		document.getElementById("Chanel").onclick = function() {
			document.getElementById("go_Chanel").click();
		};
		document.getElementById("Einstein").onclick = function() {
			document.getElementById("go_Einstein").click();
		};
		document.getElementById("Mandela").onclick = function() {
			document.getElementById("go_Mandela").click();
		};
		document.getElementById("Attenborough").onclick = function() {
			document.getElementById("go_Attenborough").click();
		};
		document.getElementById("Curie").onclick = function() {
			document.getElementById("go_Curie").click();
		};
		document.getElementById("Rowling").onclick = function() {
			document.getElementById("go_Rowling").click();
		};
		document.getElementById("Shakespeare").onclick = function() {
			document.getElementById("go_Shakespeare").click();
		};
		document.getElementById("Newton").onclick = function() {
			document.getElementById("go_Newton").click();
		};
	</script>
@endsection
