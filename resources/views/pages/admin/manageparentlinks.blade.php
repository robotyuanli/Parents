@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
  <div class="title-box d-flex justify-content-center align-items-center">
		<span style="color: white; font-size: 60px; font-weight: bold;">Manage {{ $name }} Parent Links</span>
  </div>
	<div class="container">
        <div class="row">
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;">
                <table  class="table table-striped ">
                    <thead>
                        <tr>
                            <th>
                                Parent Email
                            </th>
                            <th>
                                Child Name
                            </th>
                            <th style="text-align: center">
                                Unique Url
                            </th>
                            <th style="text-align: center">
                                View Slots
                            </th>
														<th style="text-align: center">
                                Copy URL
                            </th>
														<th style="text-align: center">
                                Status
                            </th>
                        </tr>
                    </thead>
                    <tbody>
											@if($calendar_id != -1)
												@foreach($data as $index => $item)
													<tr>
															<td>
																@if($item->email == '')
																	<span style="color: red">No Available Email</span>
																@else
																	{{ $item->email }}
																@endif
															</td>
															<td>
																{{ $item->first_name }} {{ $item->last_name }}
															</td>
															<td style="text-align: center">
																{{ $link[$index]->url }}
															</td>
															<td style="text-align: center">
																@if(count($link) > 0)
																	<a href="{{ url('/pupilslot/') }}/{{$link[$index]->url}}" id="url{{ $index }}"><i class="fa fa-eye" style="color:black; font-size:20px;"></i></a>
																@else
																	<i class="fa fa-eye" onclick="" style="color:grey; font-size:20px;"></i>
																@endif															
															</td>
															<td style="text-align: center">
																@if(count($link) > 0)
																	<a href="#" id="copyIcon" onclick='onCopy("{{ $index }}")'><i class="fa fa-copy" style="color:black; font-size:20px; margin-left: 10px;"></i></a>
															  @else
																	<i class="fa fa-copy" style="color:grey; font-size:20px; margin-left: 10px;"></i>
																@endif
																</td>
															<td style="text-align: center" id="alert{{ $index }}">
															</td>
													</tr>
												@endforeach
											@endif
                    </tbody>
                </table>
            </div>
        </div>
				<div class="row" style="margin-top: 120px;">
					<div class="col-md-12" style="padding-top:50px;position: absolute;bottom:50px;right:50px;" >
						<div class="col-md-6">
								&nbsp;
						</div>
						<div class="col-md-6">
								@if(count($data) > 0)
									<div class="col-md-6">
											@if($calendar_id != -1)
												<button onclick="generateLinks()" type="submit" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
														Generate Links
												</button>
											@endif
											@if($calendar_id == -1)
												<button onclick="" type="submit" style="opacity:0.3;text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
														Generate Links
												</button>
											@endif
									</div>
									<div class="col-md-6">
											@if($calendar_id != -1)
												<button onclick="sendEmails()" type="submit" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
														Send Emails
												</button>
											@endif
											@if($calendar_id == -1)
												<button onclick="" type="submit" style="opacity:0.3;text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
														Send Emails
												</button>
											@endif
									</div>
								@endif
						</div>
					</div>
				</div>
    </div>
		<div id="sendingmodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <h3 id="message">Sending emails...</h3	>
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
                    <h3 id="message">Sent emails successfuly!</h3	>
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
		<script>
			$(document).ready(function(){
				currentIndex = -1;
			});
			
			function onCopy(index) {
				if(currentIndex >= 0) {
					$("#alert"+currentIndex).empty();
				}
				$("#alert"+index).append("Copied!");
				navigator.clipboard.writeText($("#url"+index).attr("href"));
				currentIndex = index;
			}

			function generateLinks(){
				var childs = {}
				childs.data = {!! $data !!};
				childs.calendar_id = {!! $calendar_id !!};
				jQuery.ajax({
						url: "{{URL::route("generate.links")}}",
						method: 'get',
						data: childs,
						success: function(result){
							location.reload();
						}});
			}
			function sendEmails() {
				var data = {!! $data !!};
				var link = {!! $link !!};
				var parentLink = {};
				parentLink.data = data;
				parentLink.link = link;
				$('#sendingmodal').modal('show');
				jQuery.ajax({
						url: "{{URL::route("send.emails")}}",
						data: parentLink,
						method: 'get',
						success: function(result){
							console.log(result);
							$('#sendingmodal').modal('hide');
							$('#confirmmodal').modal('show');
						}});
			}
		</script>
@endsection
