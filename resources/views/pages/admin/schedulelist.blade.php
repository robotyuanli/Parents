@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
		<div class="title-box d-flex justify-content-center align-items-center">
			<span style="color: white; font-size: 60px; font-weight: bold;">Schedule List</span>
		</div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;">
                <table  class="table table-striped ">
                    <thead>
                    <tr>
												<th>
														Teacher Name
												</th>
                        <th>
                            Parent Name
                        </th>
                        <th>
                            Parent Email
                        </th>
                        <th>
                            Child Name
                        </th>
												<th>
														Date
												</th>
												<th>
														Time
												</th>

                    </tr>
                    </thead>
                    <tbody>
                    @foreach($schedules as $schedule)
												<?php
													if($schedule->app_from%100 == 0) {
															$rest = '00';
													}
													else if ($schedule->app_from%100 < 10) {
															$rest = '0'.$schedule->app_from%100;
													}
													else {
															$rest = $schedule->app_from%100;
													}

													if($schedule->app_from/100 > 12){
															$app_from = (($schedule->app_from - $schedule->app_from%100)/100).'.'. $rest. ' pm';
													}else{
															$app_from = (($schedule->app_from - $schedule->app_from%100)/100).'.'. $rest. ' am';
													}

													if($schedule->app_to%100 == 0) {
															$rest = '00';
													}
													else if ($schedule->app_to%100 < 10) {
															$rest = '0'.$schedule->app_to%100;
													}
													else {
															$rest = $schedule->app_to%100;
													}

													if($schedule->app_to/100 > 12){
																	$app_to = (($schedule->app_to - $schedule->app_to%100)/100).'.'. $rest. ' pm';
													}else{
																	$app_to = (($schedule->app_to - $schedule->app_to%100)/100).'.'. $rest .' am';
													}
												?>
                        <tr>
														<td>
																{{ $schedule->te_firstname }} {{ $schedule->te_lastname }}
														</td>
                            <td>
                                {{ $schedule->first_name }} {{ $schedule->last_name }}
                            </td>
                            <td>
                                {{ $schedule->email }}
                            </td>
                            <td>
                                {{ $schedule->ch_firstname }} {{ $schedule->ch_lastname }}
                            </td>
														<td>
																{{ $schedule->workingdate }}
														</td>
														<td>
																{{ $app_from }} - {{ $app_to }}
														</td>

                        </tr>
                    @endforeach
                    </tbody>
                </table>
                <div style="text-align: center; display: @if(count($schedules) > 0) none @else block @endif">
                    <p>There is no parent who attend this schedule.</p>
                </div>
            </div>
        </div>
    </div>

    <script>

    </script>
@endsection
