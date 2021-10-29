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
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Manage Parents</h2>
                <a href="{{ url('/import/parents/') }}" role="button" class="btn btn-primary"><i class="fas fas-excel"></i> Import Parents</a>
                <a href="{{ url('/parent/add/') }}" role="button" class="btn btn-secondary">Add Parents</a>
                
            </div>
            <div class="col-md-12 table-responsive-md" style="padding-top:50px;">
                <table  class="table table-striped ">
                    <thead>
                        <tr>
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
                                Actions
                            </th>
                            <th>&nbsp;
                                
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($parents as $parent)
                        <tr>
                            <td>
                                {{ $parent->first_name }} {{ $parent->last_name }}
                            </td>
                            <td>
                                {{ $parent->email }}
                            </td>
                            <td>
                                {{ $parent->ch_f_name }} {{ $parent->ch_l_name }}
                            </td>
                            <td>
                                <a href="{{ url('/parent/edit/') }}/{{$parent->id}}"><i class="fa fa-pencil" style="color:#ff9801;font-size:20px;"></i></a>
                            </td>
                            <td>
                                <i class="fa fa-close"onclick="selectDelete({{ $parent->id }})" data-toggle="modal" data-target="#deletemodal" style="color:#ff0000;font-size:20px;"></i>
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
                    <p>Do you want really to delete this parent?</p>
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
                    <p>Successfully deleted the parent.</p>
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
                url: "{{ url('/parent/delete') }}/"+id,
                method: 'get',
                success: function(result){
                    console.log(result);
                    $('#confirmmodal').modal('show');
                    location.reload();
                }});
        }
    </script>
@endsection
