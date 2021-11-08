@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
  <div class="title-box d-flex justify-content-center align-items-center">
		<span style="color: white; font-size: 60px; font-weight: bold;">These parents do not have an email</span>
  </div>
	<div class="container">
	<div class="row">
		<div class="col-md-12 table-responsive-md" style="padding-top:50px;">
			<table  class="table table-striped ">
					<thead>
							<tr>
									<th>
											Parent Name
									</th>
									<th>
											Pupil Name
									</th>
									<th style="text-align: center">
											Class
									</th>
									<th style="text-align: center">
											Bookslot
									</th>
							</tr>
					</thead>
					<tbody>
						@foreach($data as $index => $item)
							<tr>
									<td>
										{{ $item->parent_firstname }} {{ $item->parent_lastname }}
									</td>
									<td>
										{{ $item->child_firstname }} {{ $item->child_lastname }}
									</td>
									<td style="text-align: center">
										{{ $item->class_name }}
									</td>
									<td style="text-align: center">
											<i class="fa fa-eye" onclick="ViewAppointment({{$item->calendar_id}});" style="color:black; font-size:20px;"></i>
									</td>
							</tr>
						@endforeach
					</tbody>
			</table>
		</div>
	</div>
	<script>
		function ViewAppointment(id) {
				var url = '{{url("/calendarappointment/")}}/' + id;
				location.assign(url);
		}
	</script>
@endsection
