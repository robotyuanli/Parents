@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
  <div class="title-box d-flex justify-content-center align-items-center">
		<span style="color: white; font-size: 60px; font-weight: bold;">Parents Evening Dashboard</span>
  </div>
	<div class="container" style="padding: 20px 50px">
		<div class="d-flex button-row">
			<div id="importclass" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #f44336;">
				<a id="go_importclass" style="text-align: center" href="{{ url('/import/class') }}">
					<span class="button-title">Import Class</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="addpupil" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #2196f3;">
				<a id="go_addpupil" style="text-align: center" href="{{ url('/pupil/add') }}">
					<span class="button-title">Add Pupil</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="addteacher" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #009688;">
				<a id="go_addteacher" style="text-align: center" href="{{ url('/teacher/add') }}">
					<span class="button-title">Add Teacher</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="purgedata" data-toggle="modal" data-target="#deletemodal" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #ff9800;">
				<span class="button-title">Purge Data</span>
			</div>
		</div>

		<div class="d-flex button-row mt-5">
			<div id="addcalendar" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #f44336;">
				<a id="go_addcalendar" style="text-align: center" href="{{ url('/addcalendar') }}">
					<span class="button-title">Add Calendar</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="managecalendar" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #2196f3;">
				<a id="go_managecalendar" style="text-align: center" href="{{ url('/managecalendars') }}">
					<span class="button-title">Manage Calendar</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="manageusers" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #009688;">
				<a id="go_manageusers" style="text-align: center" href="{{ url('/manageusers') }}">
					<span class="button-title">Manage Users</span>
				</a>
			</div>
			<div class="space"></div>
			<div id="parentlinks" class="flex-grow-1 d-flex justify-content-center align-items-center button-box" style="width: 100%; background-color: #ff9800;">
				<a id="go_parentlinks" style="text-align: center" href="{{ url('/parentlinks') }}">
					<span class="button-title">View Parent Links</span>
				</a>
			</div>
		</div>
		<div id="deletemodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <p>This will remove all Calendars and Parent info and Pupils?</p>
                    <input type="hidden" id="did" value="0">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="color:#fff;background:#f00;" onclick="clickDelete()">Delete</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
	</div>
	<div id="deletingmodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <h3 id="message">Deleting datas...</h3	>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
		<div id="confirmmodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <h3 id="message">Deleted all data successfuly!</h3	>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
	<script>
		document.getElementById("importclass").onclick = function() {
			document.getElementById("go_importclass").click();
		};
		document.getElementById("addpupil").onclick = function() {
			document.getElementById("go_addpupil").click();
		};
		document.getElementById("addteacher").onclick = function() {
			document.getElementById("go_addteacher").click();
		};
		function clickDelete() {
			$('#deletingmodal').modal('show');
			jQuery.ajax({
					url: "{{URL::route("delete.datas")}}",
					method: 'get',
					success: function(result){
						$('#deletingmodal').modal('hide');
						$('#confirmmodal').modal('show');
					}});
		};
		document.getElementById("addcalendar").onclick = function() {
			document.getElementById("go_addcalendar").click();
		};
		document.getElementById("managecalendar").onclick = function() {
			document.getElementById("go_managecalendar").click();
		};
		document.getElementById("manageusers").onclick = function() {
			document.getElementById("go_manageusers").click();
		};
		document.getElementById("parentlinks").onclick = function() {
			document.getElementById("go_parentlinks").click();
		};		
	</script>
@endsection
