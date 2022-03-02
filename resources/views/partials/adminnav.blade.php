<div class="col-md-12" style="padding:0px;background:#012c56;padding-top:10px;min-height:calc(100vh);">

    <div class="col-md-12">
        <div class="col-md-6" style="padding:0px;">
            <a class="navbar-brand" href="{{ url('/') }}/adminhome" style="border-radius: 50px;background:#fff;color:#555 !important;font-size:17px;font-weight: normal;padding:3px 10px;height:30px;">
                Admin
            </a>
        </div>
        <div class="col-md-6 text-right" style="padding:0px;">
            <button class="navbar-toggler first-button" type="button" data-toggle="collapse" data-target="#navbarSupportedContent20"
                    aria-controls="navbarSupportedContent20" aria-expanded="false" aria-label="Toggle navigation">
                <div class="animated-icon1"><span></span><span></span><span></span></div>
            </button>
        </div>
    </div>
    <div class="col-md-12" style="background-color: #fff;margin-top:20px;text-align: left;padding-top:20px;padding-bottom:20px;">
        <!-- <a id="navbarDropdown" class="nav-link"  role="button"  style="color: #0076ff;font-size:17px;font-weight: bold;">

            {{ Auth::user()->name }}
        </a> -->
        {{--<a id="navbarDropdown" class="nav-link" href="#" role="button" style="color: #0076ff;font-size:17px;font-weight: bold;">--}}

            {{--Welcome--}}
        {{--</a>--}}
        <a id="navbarDropdown" class="nav-link" href="{{ url('/import/class') }}" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            Import Class
        </a>
        <a id="navbarDropdown" class="nav-link" href="{{ url('/pupil/add') }}" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            Add Pupil
        </a>
        <a id="navbarDropdown" class="nav-link" href="{{ url('/teacher/add') }}" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            Add Teacher
        </a>
        <a id="navbarDropdown" class="nav-link" href="{{ url('/') }}/addcalendar" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            Add Calendar
        </a>
        <a id="navbarDropdown" class="nav-link" href="{{ url('/managecalendars') }}" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            Manage Calendars
        </a>
        <a id="navbarDropdown" class="nav-link" href="{{ url('/manageusers') }}" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            Manage Users
        </a>
				
        <a id="navbarDropdown" class="nav-link" href="{{ url('/parentlinks') }}" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            View Pupil Slot Links
        </a>

				<a id="navbarDropdown" class="nav-link" href="{{ url('/parentnoemail') }}" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            View Parents No Email
        </a>
				
				<a id="navbarDropdown" class="nav-link" href="{{ url('/schedules') }}" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            Schedule List
        </a>

				<a id="navbarDropdown" class="nav-link" href="{{ url('/update/email') }}" role="button" style="color: #012c56;font-size:17px;font-weight: bold;">

            Email Update
        </a>


        <!-- <a id="navbarDropdown" class="nav-link"  href="{{ route('adminlogout') }}"
           onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();" role="button"  style="color: #0076ff;font-size:17px;font-weight: bold;">

            Logout
        </a> -->
        <form id="logout-form" action="{{ route('adminlogout') }}" method="POST" style="display: none;">
            @csrf
        </form>
    </div>
    {{--@if(Request::is('addcalendar'))--}}
    {{--<div class="col-md-12" style="margin-top:20px;text-align: center;padding-top:20px;padding-bottom:20px;">--}}
        {{--<p style="margin:5px;border:2px solid white;padding:8px;color:#fff;font-size:25px;">--}}
            {{--{{ date('m-d-Y') }}--}}
        {{--</p>--}}
    {{--</div>--}}
    {{--@endif--}}
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $('.first-button').on('click', function () {
            $('.animated-icon1').toggleClass('open');
        });
        $('.second-button').on('click', function () {
            $('.animated-icon2').toggleClass('open');
        });
        $('.third-button').on('click', function () {
            $('.animated-icon3').toggleClass('open');
        });
    });
</script>
