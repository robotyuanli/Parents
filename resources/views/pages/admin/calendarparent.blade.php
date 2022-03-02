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
                <h2 style="text-align: center; font-size:30px;font-weight: bold;">Parents on Schedule</h2>
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
                                {{ $parent->ch_firstname }} {{ $parent->ch_lastname }}
                            </td>

                        </tr>
                    @endforeach
                    </tbody>
                </table>
                <div style="text-align: center; display: @if(count($parents) > 0) none @else block @endif">
                    <p>There is no parent who attend this schedule.</p>
                </div>
            </div>
        </div>
    </div>

    <script>

    </script>
@endsection
