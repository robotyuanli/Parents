@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
    <style>
        .import{
            padding: 20px 15px;
            font-size: 16px;
            display: block;
            line-height: 1.42857143;
            color: #555;
            border: 1px solid #ececf3;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
            -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
            text-align: center;
            background: #f1f1f4;
        }
    </style>
    {{--<link rel="stylesheet" href="/css/jquery-ui.css">--}}
    {{--<script type="text/javascript" src="/js/jquery-2.1.1.js"></script>--}}
    {{--<script type="text/javascript" src="/js/jquery-ui.js"></script>--}}

		<div class="title-box d-flex justify-content-center align-items-center">
			<span style="color: white; font-size: 60px; font-weight: bold;">Import Pupil's</span>
		</div>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <form id="import-csv-form" method="POST" action="#" accept-charset="UTF-8"  enctype="multipart/form-data">
                    <div class="col-md-12" style="padding-top:50px;">
                        <input autocomplete="new-password" type="hidden" name="_token" value="{{csrf_token()}}"/>
                        <div class="">
                            <p>Select CSV | XLSX</p>
                            <input class="import col-md-6" type="file" id="customer_csv" name="customer_csv" accept=".csv, text/csv, .xlsx"/>
                            <div class="col-md-6">
                                {{--<input class="save_btn btn updatebtn pull-right" value="Import" type="submit">--}}
                                <button type="submit" style="text-align:center;color:#fff;font-size:25px;font-weight: bold;display:block;width:240px;background-color: #00137f;padding:15px 0px;border-radius: 7px;text-decoration: none">
                                    Import Class
                                </button>
                            </div>
                        </div>
                    </div>
										<div class="col-md-12" style="margin-top: 100px">
											<h1 style="font-weight: bold">CSV must contain the following fields...</h1>
											<img src="{{ asset('/images/table.png') }}" style="height:auto;">
										</div>
                </form>
            </div>

        </div>
    </div>

    <div id="loadingModal" class="modal fade" role="dialog"  data-backdrop="static" data-keyboard="false" style="top: 120px;">
        <div class="modal-dialog modal-sm">
            <div class="modal-content" >
                <div class="modal-body">
                    <div class="row text-center">
                        <br>
                        <label style="width: 100%;">Processing...</label>
                        <br>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="resultModal" class="modal fade" role="dialog" style="top: 120px;">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" >
                <div class="modal-body">
                    <div class="row text-center" style="height: 120px;">
                        <br>
                        <h2 id="content" style="width: 100%;"></h2>
                        <p id="content2" style="width: 100%;"></p>
                        <br>
                    </div>
                    <div class="row">
                        <button style="width: 50%;margin-left: 25%;" type="button" id="modal_ok_button" class="btn btn-block btn-facebook" data-dismiss="modal">OK</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('#import-csv-form').on("submit", function(e){
            e.preventDefault(); //form will not submitted
            showSpinner();
            $.ajax({
                url: '{{ url('/import/class/file') }}',
                method:"POST",
                data:new FormData(this),
                contentType:false,          // The content type used when sending data to the server.
                cache:false,                // To unable request pages to be cached
                processData:false,          // To send DOMDocument or non processed data file it is set to false
                success: function(result){
									hideSpinner();
									console.log(result.message);
									if(result.message == 'empty') {
											$('#content').html('Empty');
											$('#content2').html('Current file is empty.');
									}
									else if(result.message == 'field missing') {
											$('#content').html('Failed');
											$('#content2').html('Some fields are missing.');
									}
									else if(result.message == 'value empty') {
											$('#content').html('Failed');
											$('#content2').html('Some values are empty.');
									}
									else {
										$('#content').html('Success');
										$('#content2').html('');
									}
									$('#resultModal').modal('show');
                },
                error:function(){
                    hideSpinner();
                }
            });
        });

        function showSpinner(){
            $('#loadingModal').modal('show');
        }
        function hideSpinner() {
            $('#loadingModal').modal('hide');
        }
    </script>
@endsection
