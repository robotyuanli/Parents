@extends('layouts.adminapp')

@section('template_title')
    Welcome {{ Auth::user()->name }}
@endsection

@section('head')
@endsection

@section('content')
    <div class="container">
        <div class="row">
            <div class="col-md-12" style="padding-top:50px;">
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Manage Pupils</h2>
				<a href="{{ url('/pupil/add') }}">Add Pupil</a>
            </div>
            <div class="col-md-12" style="padding-top:50px;">

                <div class="form-group col-md-12">
                    <label for="class_id" class="col-md-12 col-form-label text-md-left">Childs Class</label>

                    <div class="col-md-12">
                        <select id="class_id" name="class_id" class="form-control" onchange="changeClass()" style="width:200px;height:34px;">
                            <option value="0" ></option>
                            @foreach($classes as $class)
                                <option value="{{ $class->id }}" @if($class_id  == $class->id ) selected @endif>{{ $class->name }}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-md-12 table-responsive-md" style="padding-top:20px;">
                <table  class="table table-striped ">
                    <thead>
                        <tr>
                            <th>
                                Pupils Name
                            </th>
							 <th>
                                Class Name
                            </th>
                            <th>
                                Actions
                            </th>
                            <th>&nbsp;
                                
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($pupils as $pupil)
						
						<?php $class_name = DB::table('classes')->where('id', $pupil->class_id)->first();?>
                        <tr>
                            <td>
                                {{ $pupil->first_name }} {{ $pupil->last_name }}
                            </td>
							 <td>
                                {{ $class_name->name }} 
                            </td>
                            <td>
                                <a href="{{ url('/pupil/edit/') }}/{{$pupil->id}}"><i class="fa fa-pencil" style="color:#ff9801;font-size:20px;"></i></a>
                            </td>
                            <td>
                                <i class="fa fa-close"onclick="selectDelete({{ $pupil->id }})" data-toggle="modal" data-target="#deletemodal" style="color:#ff0000;font-size:20px;"></i>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="deletemodal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-body">
                    <p>Do you want really to delete this pupil?</p>
                    <input type="hidden" id="did" value="0">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" style="color:#fff;background:#f00;" onclick="clickDelete()">Delete</button>
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
                    <p>Successfully deleted the pupil.</p>
                    <input type="hidden" id="did" value="0">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>
    <script>
        function selectDelete(id){
            console.log(id);
            $('#did').val(id);
        }
        function clickDelete(){
            var id = $('#did').val();
            jQuery.ajax({
                url: "{{ url('/pupil/delete') }}/"+id,
                method: 'get',
                success: function(result){
                    console.log(result);
                    $('#confirmmodal').modal('show');
                    location.reload();
                }});
        }
        function clickAdd(){
            location.href="{{ url('/pupil/add') }}";
        }
        function changeClass(){
            var id = $('#class_id').val();
            location.href="{{ url('/managepupils/') }}/"+id;
        }
    </script>
@endsection
