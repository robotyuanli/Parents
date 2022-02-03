<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Maatwebsite\Excel\Facades\Excel;
use App\Request\ClassesRequest;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Models\User;
use App\Models\ParentLink;
use App\Traits\CaptchaTrait;
use App\Traits\CaptureIpTrait;
use App\Traits\ActivationTrait;
use jeremykenedy\LaravelRoles\Models\Role;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class AdminController extends Controller
{
		use ActivationTrait;
		use CaptchaTrait;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function addcalendar()
    {
        $classes = DB::table('classes')->get();
        // $teachers = DB::table('teachers')->get();
				$teachers = DB::table('teachers as t')
            ->join('classes as c', 'c.id', '=', 't.class_id')
            ->select('t.*', 'c.name')
            ->get();
        return view('pages.admin.addcalendar', compact('classes', 'teachers'));
    }
    public function storecalendar(Request $request){
        $workingdate = $request->get('calendardate', '00-00-0000');
        $class_id = $request->get('class_id', '0');
        $teacher_id = $request->get('teacher_id', '0');
        $duration = $request->get('duration', '0');
        $app_from = $request->get('app_from', '0');
        $app_to = $request->get('app_to', '0');

        $calendar_id = \DB::table('t_calendars')->insertGetId([
            'workingdate'              => $workingdate,
            'class_id'        => $class_id,
            'teacher_id'         => $teacher_id,
            'duration'             => $duration,
            'app_from'             => $app_from,
            'app_to'             => $app_to,
        ]);
        $minutes = (($app_to - $app_to%100)/100 * 60 + $app_to%100) - (($app_from - $app_from%100)/100 * 60 + $app_from%100);
        // $count_slot =  ($minutes - $minutes % (int)$duration)/$duration;
        // $count_slot = (+$app_to - +$app_from)/+$duration;
        $count_slot = ($minutes - $minutes%$duration)/+$duration;
        for($idx =0 ; $idx < $count_slot; $idx++){
            $data = [
                'calendar_id'=>$calendar_id,
                'order'=>$idx + 1,
                'duration'=>$duration,
                'updated_at'=>date('Y-m-d H:i:s')
            ];
            DB::table('t_calendar_slot')->insert($data);
        }
        if($minutes%$duration > 0) {
            $data = [
                'calendar_id'=>$calendar_id,
                'order'=>$idx + 1,
                'duration'=>$minutes%$duration,
                'updated_at'=>date('Y-m-d H:i:s')
            ];
            DB::table('t_calendar_slot')->insert($data);
        }
        return Redirect::back();
    }

    public  function deletecalendar(Request $request){
        $schedule_id = $request->get('schedule_id', 0);

        \DB::table('t_calendars')
            ->where('id', $schedule_id)
            ->update(['is_deleted'=> 1]);
				\DB::table('parent_links')
						->where('c_id', $schedule_id)
						->update(['is_deleted'=> 1]);

        $ret = array();
        $ret['code'] = $schedule_id;
        $ret['message'] = 'removed';
        return \GuzzleHttp\json_encode($ret);
		}

    public function showCalendarAppointment(Request $request, $calendar_id){
        $calendar_id = $calendar_id;
        if($calendar_id == 0)
            return Redirect::back();

        $children = DB::table('t_calendars as ca')
            ->leftJoin('teachers as te','ca.teacher_id','=','te.id')
            ->leftJoin('childs as ch','te.class_id','=','ch.class_id')
            ->leftJoin('users as u','u.id','=','ch.p_id')
            ->select('ch.first_name', 'ch.last_name', 'ch.id', 'ch.p_id')
            ->where('ca.id', $calendar_id)
            ->get();

        $slots = \DB::table('t_calendar_slot as sl')
            ->leftJoin('parent_slot as ps', function($join){
                $join->on('sl.id','=','ps.slot_id');
                $join->where('is_deleted', 0);
            })
            ->leftJoin('t_calendars as ca','ca.id','=','sl.calendar_id')
            ->leftJoin('teachers as t','ca.teacher_id','=','t.id')
            ->leftJoin('m_prefix as pre','pre.id','=','t.prefix')
            ->leftJoin('users as u', 'ps.parent_id', '=', 'u.id')
            ->leftjoin('childs as c', 'c.id', '=', 'ps.c_id')
            ->select('ps.id as appointment_id'
                , 'u.*', 'c.full_name','c.first_name as ch_f_name','c.last_name as ch_l_name'
                ,'ps.created_at as appoint_date'
                ,'ps.is_deleted'
                ,'sl.id as slot_id'
                ,'sl.order'
                ,'ps.parent_id'
                ,'sl.duration as meeting_time'
                ,'ca.duration'
                ,'ca.app_from'
                ,'ca.app_to'
                ,'t.first_name as t_first_name'
								,'t.last_name as t_last_name'
                ,'pre.name as prefix'
            )
            ->where('ca.id', $calendar_id)
            ->orderby('sl.id')
            ->get();
            // dd($children);
        return view('pages.admin.calendarappointment',compact('slots','children', 'calendar_id'));
    }

    public function deleteAppointment($appointment_id){
        $result = \DB::table('parent_slot')->where('id', $appointment_id)->update(['is_deleted'=>1]);
        $ret = array();
        $message = 'Successfully deleted the appointment.';
        if($result == 0){ // fail
            $message = 'Fail to delete appointment';
        }
        $ret['code'] = $result;
        $ret['msg'] = $message;
        return \GuzzleHttp\json_encode($ret);
    }

    public function manageusers(){
        return view('pages.admin.manageusers');
    }
    public function managecalendars(){
        $schedules = DB::table('t_calendars as s')
            ->leftjoin('classes as cs', 'cs.id', '=', 's.class_id')
            ->leftjoin('teachers as t', 't.id', '=', 's.teacher_id')
            ->select('s.*', 'cs.name as class_name', 't.full_name as t_full_name','t.first_name as t_f_name', 't.last_name as t_first_name', 't.prefix')
            ->where('s.is_deleted', 0)
            ->orderby('s.workingdate', 'asc')
            ->get();
        return view('pages.admin.managecalendars', compact('schedules'));
    }
    public function manageparents(){
        $parents = DB::table('users as u')
            ->join('role_user as ru', 'ru.user_id', '=', 'u.id')
            ->join('childs as c', 'c.p_id', '=', 'u.id')
            ->select('u.*', 'c.full_name','c.first_name as ch_f_name','c.last_name as ch_l_name' )
            ->where('ru.role_id', 2)
            ->get();
        return view('pages.admin.manageparents', compact('parents'));
    }
    public function editparent($id){
        $parent = DB::table('users as u')
            ->join('role_user as ru', 'ru.user_id', '=', 'u.id')
            ->join('childs as c', 'c.p_id', '=', 'u.id')
            ->select('u.*', 'c.first_name as c_first_name', 'c.last_name as c_last_name', 'c.class_id')
            ->where('ru.role_id', 2)
            ->where('u.id', $id)
            ->first();
        $classes = DB::table('classes')->get();
        return view('pages.admin.editparent', compact('parent', 'classes'));
    }
    public function updateparent(Request $request){
        $first_name = $request->get('first_name', '');
        $last_name = $request->get('last_name', '');
        $c_first_name = $request->get('c_first_name', '');
        $c_last_name = $request->get('c_last_name', '');
        $class_id = $request->get('class_id', 0);
        $id = $request->get('id', 0);
		
		$user_details = DB::table('users')->where('id',$id)->first();
		if(!empty($request->get('password')))
		{
			$password = Hash::make($request->get('password'));
		}
		else
		{
			$password = $user_details->password;
		}
		
		
        \DB::table('users')->where('id', $id)->update([
            'name'              => $last_name.$first_name,
            'first_name'        => $first_name,
            'last_name'         => $last_name,
			'password'			=> $password,
        ]);
        \DB::table('childs')->where('p_id', $id)->update([
            'full_name'              => $c_last_name.$c_first_name,
            'first_name'        => $c_first_name,
            'last_name'         => $c_last_name,
            'class_id'             => $class_id,
        ]);
        return Redirect::to('/manageparents');
    }
	
	 public function addparent() {
			
			return view('pages.admin.addparent');
	  
		 }
	 
	  public function addparent1(Request $request){
	 	
		$first_name=$last_name=$email=$c_first_name=$c_last_name=$class_id=$password=$chk_name='';
		 $ipAddress = new CaptureIpTrait();
		   $role = Role::where('slug', '=', 'user')->first();
		$first_name = $request->post('first_name', '');
        $last_name = $request->post('last_name', '');
		$email = $request->post('email', '');
        $c_first_name = $request->post('c_first_name', '');
        $c_last_name = $request->post('c_last_name', '');
        $class_id = $request->post('class_id', 0);
		$password = Hash::make($request->post('password'));
		$get_exist_email=$get_exist_name=array();
		$chk_name=$last_name.$first_name;
		$get_exist_email=DB::table('users')->where('email',$email)->first();
		$get_exist_name=DB::table('users')->where('name',$chk_name)->first();
		if(!empty($get_exist_email) && $get_exist_email->email)
		{
		return redirect('/parent/add')->with('flash_error','Email Already Exist.')->withInput();
		}
		if(!empty($get_exist_name) && $get_exist_name->name)
		{
		return redirect('/parent/add')->with('flash_error','Name Already Exist.')->withInput();
		}
		
		$user = User::create([
                'name'              => $last_name.$first_name,
                'first_name'        => $first_name,
                'last_name'         => $last_name,
                'email'             => $email,
                'password'          => $password,
                'token'             => str_random(64),
                'signup_ip_address' => $ipAddress->getClientIp(),
                'activated'         => 1,
            ]);
			
			 $user->attachRole($role);

			if($c_first_name != '' || $c_last_name != ''){
				\DB::table('childs')->insert([
					'full_name'         => $c_last_name.$c_first_name,
					'first_name'        => $c_first_name,
					'last_name'         => $c_last_name,
					'class_id'          => $class_id,
					'p_id'            	=> $user->id,
				]);
			}
			return Redirect::to('/manageparents');
		
		
	 
	  
	 }
	 
    public function deleteparent($id){
        DB::table('childs')->where('p_id', $id)->delete();
        DB::table('users')->where('id', $id)->delete();
        DB::table('role_user')->where('user_id', $id)->delete();
        return 1;
		}
		
		public function generateLinks(Request $request) {
			$data = $request->get('data');
			$calendar_id = $request->get('calendar_id');
			for($i = 0 ; $i < count($data) ; $i ++) {
				$keys = ['c_id'=>$calendar_id, 'parent_id'=>$data[$i]['p_id']];
				$parentlink = ParentLink::firstOrNew($keys);
				$parentlink->c_id = $calendar_id;
				$parentlink->parent_id = $data[$i]['p_id'];
				$parentlink->url = md5(uniqid($calendar_id.$data[$i]['p_id'], true));
				$parentlink->save();
			}	
			$ret = array();
			$ret['message'] = 'success';
			return json_encode($ret);
		}

		public function sendEmails(Request $request) {
			$data = $request->get('data');
			$link = $request->get('link');
			require_once getcwd()."/php_mail/vendor/autoload.php";
			
			for($i = 0 ; $i < count($link) ; $i ++) {
				$mail = new PHPMailer;
				$mail->IsSMTP();                                      // Set mailer to use SMTP
                $mail->Host = 'smtp.office365.com';                 // Specify main and backup server
				$mail->Port = 587;                                    // Set the SMTP port
				$mail->SMTPAuth = true;                               // Enable SMTP authentication
				$mail->Username = 'parents@queenscofe.org.uk';                // SMTP username
				$mail->Password = 'Sud09358';                  // SMTP password
				$mail->SMTPSecure = 'tls';         
				//From email address and name
				$mail->From = "parents@queenscofe.org.uk";
                $mail->FromName = "Parents System.";
				
				//To address and name
				$mail->addAddress($data[$i]['email']);
				$mail->isHTML(true);
				
				$mail->Subject = "Pupil Slot";
				$url = "http://criteria.loginto.me/Parents/public/pupilslot/".$link[$i]['url'];
				$mail->Body = "Hello!<p>Please see below for your unique access URL for the parents evening coming up.</p><p>URL: <a href='".$url."'>".$url."</a></p><p>Any problems, please contact your Class Teacher via Class Dojo or the school office on 02476 382 906</p><p>Many thanks";
				$mail->send();
			}
			$ret = array();
			$ret['message'] = 'success';
			return json_encode($ret);
		}
		
		public function parentlinks() {
			return view('pages.admin.parentlinks');
		}

		public function parentnoemail() {
			$data = DB::table('users as us')
								->join('role_user as ru', 'us.id', '=', 'ru.user_id')
								->join('childs as ch', 'us.id', '=', 'ch.p_id')
								->join('classes as cl', 'cl.id', '=', 'ch.class_id')
								->join('t_calendars as ca', 'ca.class_id', '=', 'cl.id')
								->where('ru.role_id', 2)
								->where('us.email', null)
								->where('ca.is_deleted', 0)
								->select('us.first_name as parent_firstname', 'us.last_name as parent_lastname',
									'ch.first_name as child_firstname', 'ch.last_name as child_lastname',
									'cl.name as class_name', 'ca.id as calendar_id')
								->get();
			return view('pages.admin.parentnoemail', compact('data'));
		}

		public function manageparentlinks($name) {
			$class = DB::table('classes')->where('name', $name)->get();
			$class_id = $class[0]->id;
			$current_calendar = DB::table('t_calendars')
															->where('class_id', $class_id)
															->where('is_deleted', 0)
															->get();
			if(count($current_calendar) == 0) {
				$calendar_id = -1;
			}
			else {
				$calendar_id = $current_calendar[0]->id;
			}
			$data = DB::table('childs as ch')
						->join('users as u', 'u.id', '=', 'ch.p_id')
						->where('ch.class_id', $class_id)
						->select('u.email', 'ch.first_name', 'ch.last_name', 'ch.id', 'ch.p_id')
						->get();
			$link = DB::table('childs as ch')
						->join('users as u', 'u.id', '=', 'ch.p_id')
						->join('parent_links as pl', 'pl.parent_id', '=', 'ch.p_id')
                        ->where('pl.c_id', $calendar_id)
						->where('ch.class_id', $class_id)
						->select('pl.url')
						->get();
			return view('pages.admin.manageparentlinks', compact('name', 'data', 'link', 'calendar_id'));
		}

    public function manageteachers(){
        $teachers = DB::table('teachers as t')
            ->join('classes as c', 'c.id', '=', 't.class_id')
            ->select('t.*', 'c.name')
            ->get();
        return view('pages.admin.manageteachers', compact('teachers'));
    }
    public function editteacher($id){
        $teacher = DB::table('teachers as t')
            ->join('classes as c', 'c.id', '=', 't.class_id')
            ->select('t.*', 'c.name')
            ->where('t.id', $id)
            ->first();
        $classes = DB::table('classes')->get();
        return view('pages.admin.editteacher', compact('teacher', 'classes'));
    }

    public function showTeacherCalendar($id){
        $teacher = DB::table('teachers as te')
            ->leftJoin('m_prefix as pre', 'te.prefix', '=' ,'pre.id')
            ->select('te.first_name', 'te.last_name',  'pre.name')
            ->where('te.id', $id)->first();

        $schedules = DB::table('t_calendars as s')
            ->join('classes as cs', 'cs.id', '=', 's.class_id')
            ->join('teachers as t', 't.id', '=', 's.teacher_id')
            ->select('s.*', 'cs.name as class_name', 't.full_name as t_full_name', 't.first_name as t_first_name',  't.last_name as t_last_name', 't.prefix')
            ->where('s.teacher_id', $id)
            ->where('is_deleted', 0)
            ->orderby('s.workingdate', 'asc')
            ->get();
        return view('pages.admin.calendarteacher', compact('schedules', 'teacher'));
    }

    public function showCalendarParent($id){
        $parents = DB::table('parent_slot as ps')
            ->leftJoin('users as u','u.id','=','ps.parent_id')
            ->leftjoin('role_user as ru', 'ru.user_id', '=', 'u.id')
            ->leftjoin('childs as c', 'c.p_id', '=', 'u.id')
            ->select('u.*', 'c.full_name')
            ->where('ru.role_id', 2)
            ->where('ps.schedule_id', $id)
            ->get();
        return view('pages.admin.calendarparent', compact('parents'));
    }
    public function updateteacher(Request $request){
        $first_name = $request->get('first_name', '');
        $last_name = $request->get('last_name', '');
        $class_name = $request->get('class_name', '');
        $id = $request->get('id', 0);
        $teacher = \DB::table('teachers')->where('id', $id)->update([
            'full_name'              => $last_name.$first_name,
            'first_name'        => $first_name,
            'last_name'         => $last_name,
        ]);
        $teacher = \DB::table('teachers')->where('id', $id)->first();
        \DB::table('classes')->where('id', $teacher->class_id)->update([
            'name'              => $class_name,
        ]);
        return Redirect::to('/manageteachers');
    }
    public function addteacher(){
        $classes = DB::table('classes')->get();
        $prefix = DB::table('m_prefix')->get();
        return view('pages.admin.addteacher', compact('classes', 'prefix'));
    }
    public function storeteacher(Request $request){
        $prefix = $request->get('prefix', 0);
        $first_name = $request->get('first_name', '');
        $last_name = $request->get('last_name', '');
        $class_name = $request->get('class_name', '');
        $class_id = \DB::table('classes')->insertGetId([
            'name'              => $class_name,
        ]);
        \DB::table('teachers')->insert([
            'full_name'                 => $last_name.$first_name,
            'first_name'                => $first_name,
            'prefix'                    => $prefix,
            'last_name'                 => $last_name,
            'class_id'                  => $class_id,
        ]);
        return Redirect::to('/manageteachers');
    }
    public function deleteteacher($id){
        DB::table('teachers')->where('id', $id)->delete();
        return 1;
    }
    public function managepupils($class_id){
        if($class_id == 0){
            $class = DB::table('classes')->first();
            $class_id = $class->id;
            $pupils = DB::table('childs')->where('class_id', $class->id)->get();
        }else{
            $pupils = DB::table('childs')->where('class_id', $class_id)->get();
        }
        $classes = DB::table('classes')->get();
        return view('pages.admin.managepupils', compact('pupils', 'classes', 'class_id'));
    }
    public function editpupil($id){
        $pupil = DB::table('childs')->where('id', $id)->first();
        $classes = DB::table('classes')->get();
        $parents = DB::table('users')->leftJoin('role_user','users.id', 'role_user.user_id')->where('role_user.role_id',2)->get(['users.id', 'users.name']);
        return view('pages.admin.editpupil', compact('pupil', 'classes', 'parents'));
    }
    public function updatepupil(Request $request){
        $first_name = $request->get('first_name', '');
        $last_name = $request->get('last_name', '');
        $class_id = $request->get('class_id', 0);
        $parent_id = $request->get('parent_id', 0);
        $id = $request->get('id', 0);
        \DB::table('childs')->where('id', $id)->update([
            'full_name'              => $last_name.$first_name,
            'first_name'        => $first_name,
            'last_name'         => $last_name,
            'class_id'         => $class_id,
            'p_id'                  => $parent_id
        ]);
        return Redirect::to('/managepupils/'.$class_id);
    }
    public function deletepupil($id){
        DB::table('childs')->where('id', $id)->delete();
        return 1;
    }
    public function addpupil(){
        $classes = DB::table('classes')->get();
        $parents = DB::table('users')->leftJoin('role_user','users.id', 'role_user.user_id')->where('role_user.role_id',2)->get(['users.id', 'users.name']);
        //dd($parents);
        return view('pages.admin.addpupil')
            ->with('classes',$classes)
            ->with('parents', $parents)
        ;
    }
    public function storepupil(Request $request){
        $first_name = $request->get('first_name', '');
        $last_name = $request->get('last_name', '');
        $class_id = $request->get('class_id', 0);
        $parent_id = $request->get('parent_id', 0);
        \DB::table('childs')->insert([
            'full_name'              => $last_name.$first_name,
            'first_name'        => $first_name,
            'last_name'         => $last_name,
            'class_id'             => $class_id,
            'p_id'                  => $parent_id
        ]);
        return Redirect::to('/managepupils/'.$class_id);
    }

    public function importClass(Request $request){
        return view('pages.admin.importclass');
    }

    public function importParents(Request $request){
        return view('pages.admin.importparent');
    }

    public function importClassFromFile(Request $request){
			$file = $request->file('customer_csv', '');
			if(empty($file)){
					return response()->json(['message' => 'empty']);
			}
			$path = $request->file('customer_csv')->getRealPath();
			$data = Excel::load($path)->get();
			$class = [];
			$k = 0;
			for($i = 0 ; $i < count($data) ; $i ++) {
				$sheet = $data[$i];
				for($j  = 0 ; $j < count($sheet) ; $j ++) {
					if(!($sheet[$j]['pupil_forename'] == null && $sheet[$j]['pupil_surname'] == null && $sheet[$j]['class'] == null && 
						 $sheet[$j]['parent_forename'] == null && $sheet[$j]['parent_surname'] == null && $sheet[$j]['parent_email'] == null)) {
						$class[$k] = $sheet[$j];
						$k ++;
					}
				}
			}
			$table = [];
			foreach ($class[0] as $key => $value) {
					$table += [ $key => $value ];
			}
			$csv_error = Validator::make($table, (new ClassesRequest)->rules())->errors();
			if(count($csv_error) > 0) {
				return response()->json(['message' => 'field missing']);
			}
			else {
				$flag = true;
				for($i = 0 ; $i < count($class) ; $i ++) {
					if($class[$i]['pupil_forename'] == '' || $class[$i]['pupil_surname'] == '' || $class[$i]['class'] == '' || 
						$class[$i]['parent_forename'] == '' || $class[$i]['parent_surname'] == '') {
						$flag = false;
						break;
					}
				}
				if($flag) {
					$role = Role::where('slug', '=', 'user')->first();
					for($i = 0 ; $i < count($class) ; $i ++) {
						$user = User::firstOrNew(['name'=>$class[$i]['parent_surname'].$class[$i]['parent_forename']]);
						$user->name = $class[$i]['parent_surname'].$class[$i]['parent_forename'];
						$user->first_name = $class[$i]['parent_forename'];
						$user->last_name = $class[$i]['parent_surname'];
						$user->email = $class[$i]['parent_email'];
						$user->password = '';
						$user->token = str_random(64);
						$user->activated = 1;
						$user->save();
						$user->attachRole($role);
						
						DB::table('childs')->updateOrInsert(
							['full_name'				=> $class[$i]['pupil_surname'].$class[$i]['pupil_forename']],
							[
							'full_name'         => $class[$i]['pupil_surname'].$class[$i]['pupil_forename'],
							'first_name'        => $class[$i]['pupil_forename'],
							'last_name'         => $class[$i]['pupil_surname'],
							'class_id'          => DB::table('classes')->where('name', $class[$i]['class'])->first()->id,
							'p_id'            	=> $user->id,
							]
						);
					}
					return response()->json(['message' => 'success', 'data' => $class]);
				}
				else {
					return response()->json(['message' => 'value empty', 'data' => $data]);
				}
			}
    }

    public function importParentsFromFile(Request $request){
        $ipaddress =  new CaptureIpTrait();
        try{
            $file = $request->file('customer_csv', '');
            if(empty($file)){
                return response()->json(['success' => '404']);
            }
            $path = $request->file('customer_csv')->getRealPath();

            $data = Excel::load($path)->get();
            $totalRow = count($data);
            //var_dump($data);die();
            if ($totalRow) {
                $insertedRecords = $notInsertedRecords = 0;
                $errorData = $successData = $csv_errors = $notImportedCSV = $importedCSV = [];
				
                foreach ($data as $key => $value) {
                    $ret = array();
                    $ret['code'] = 0;
                    $ret['csv_error'] = array();
                    $ret['eData'] = array();

                    $name = $value->parents_first_name;
                    $email = $value->email;
                    $childname = $value->child_first_name;
                    $arrCheck = [
                        'parents_first_name' => $name
                    ];
                    $niceNames = [
                        'Parents Name'
                    ];
                    $csv_error = Validator::make($arrCheck, (new ClassesRequest)->rules2(), [], $niceNames)->errors();
                    // if ($csv_error->any()) {
                    //     $csv_errors = $csv_error->keys();
                    //     $reason =['reason'=> $csv_error->first()];
                    //     $erroData = $arrCheck + $reason;
                    //     $ret = array();
                    //     $ret['code'] = 0;
                    //     $ret['csv_error'] = $csv_errors;
                    //     $ret['eData'] = array_values($erroData);
                    // }
                    if(1==1){
                        //dd($value);
                        \DB::begintransaction();
                        $keys = ['email'=>$email];
                        $data = [
                            'name' => $value->parents_last_name.$name,
                            'first_name'=>$name,
                            'last_name'=> $value->parents_last_name,
                            'email' => $value->email,
                            'password'=>Hash::make($value->password),
                            'signup_ip_address' => $ipaddress->getClientIp(),
                            'role' => Role::where('slug', '=', 'user')->first(),
                            'token'             => str_random(64),
                            'activated' =>1,
                            'updated_at'=>date('Y-m-d H:i:s'),
                        ];

                        $user = User::updateOrCreate($keys,$data);
                        $user->attachRole(Role::where('slug', '=', 'user')->first());
                        if($value->child_first_name!=='' && $value->child_last_name!==''){
                            \DB::table('childs')->insert([
                                'full_name'         => $value->child_last_name.$value->child_first_name,
                                'first_name'        => $value->child_first_name,
                                'last_name'         => $value->child_last_name,
                                'class_id'          => \DB::table('classes')->where('name', $value->class)->first()->id,
                                'p_id'            	=> $user->id,
                            ]);
                        }
                        $ret = array();
                        $ret['code'] = 1;
                        $ret['eData'] = array_values($arrCheck);
                        \DB::commit();

                    }
                    $code = $ret['code'];
                    if($code == 1){
                        $successData[] = $ret['eData'];
                        $insertedRecords++;
                    }
                    if($code == 0){
                        $csv_errors[] = $ret['csv_error'];
                        $errorData[]  = $ret['eData'];
                        $notInsertedRecords++;
                    }
                }


                if (!empty($errorData) && count($errorData) > 0) {
                    $notImportedCSV = $this->exportExcelFailureData($errorData);
                }
                if (!empty($successData)) {
                    $importedCSV = $this->exportExcelData($successData);
                }
                if (!empty($csv_errors) || (!empty($errorData) && count($errorData) > 0)) {
                    return response()->json(
                        ['success' => '111',
                            'errors' => $errorData,
                            'csv' => $notImportedCSV,
                            'insertedRecords' => $insertedRecords,
                            'notInsertedRecords' => $notInsertedRecords,
                            'successCsv' => $importedCSV,
                            'sample'=>$value
                        ]);
                } else {
                    return response()->json(['success' => '200']);
                }
            }
            else{
                return response()->json(['success' => '401']);
            }
        }
        catch (\Exception $e){
            \DB::rollBack();
            return response()->json(['success' => '500', 'err_msg'=>$e->getMessage()]);
        }
    }


    /**
     * Export Not Inserted Records of contract opening
     *
     * @param export Data array $exportData
     * @return imported file Path
     */
    public function exportExcelFailureData($exportData) {
        $headers = ['Class Name'
            , 'Reason'
        ];
        $filename = date('YmdHi') . '_Fail';
        $data = array_merge(array($headers), $exportData);
        Excel::create($filename, function($excel) use($data) {
            $excel->sheet('userlist', function($sheet) use($data) {
                $sheet->setFontFamily('ＭＳ Ｐゴシック');
                $sheet->setWidth(
                    ['A' => 20
                        ,'B' => 40
                    ]
                );
                $sheet->fromArray($data, null, 'A1', false, false);
            });
        })->store('xls', storage_path('app/public/excel/exports'));

        return Storage::url('excel/exports/'. $filename. '.xls');
    }

    /**
     * Export Inserted Records of contract opening
     *
     * @param export Data array $exportData
     * @return imported file Path
     */
    public function exportExcelData($exportData) {
        $headers = ['Class Name'
        ];
        $filename = date('YmdHi') . '_Success';
        $data = array_merge(array($headers), $exportData);
        Excel::create($filename, function($excel) use($data) {
            $excel->sheet('userlist', function($sheet) use($data) {
                $sheet->setFontFamily('ＭＳ Ｐゴシック');
                $sheet->setWidth(
                    ['A' => 20
                    ]
                );
                $sheet->fromArray($data, null, 'A1', false, false);
            });
        })->store('xls', storage_path('app/public/excel/exports'));

        return Storage::url('excel/exports/'. $filename. '.xls');
    }
}
