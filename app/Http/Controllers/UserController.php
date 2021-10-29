<?php

namespace App\Http\Controllers;

use Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Http\Request;
use App\Models\ParentSlot;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
class UserController extends Controller
{
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
    public function index()
    {
        $user = Auth::user();
            //echo $user->isAdmin();return;
        if ($user->isAdmin()) {
            return Redirect::to('/adminhome');
        }

        $teacher = \DB::table('users as u')
            ->leftJoin('childs as ch','ch.p_id','=','u.id')
            ->leftJoin('teachers as te','te.class_id','=','ch.class_id')
            ->select('te.first_name','te.last_name','te.full_name','te.id')
            ->where('u.id', $user->id)
            ->first()
        ;
//        $booked_ids = \DB::table('parent_slot')
//            ->where('parent_id', $user->id)
//            ->where('is_deleted', 0)
//            ->select('id','schedule_id')->get()->toArray();
//        $bookidarray = [];
//        foreach ($booked_ids as $booked_id) {
//            $bookidarray[] = $booked_id->schedule_id;
//        }


        $today = date('m/d/Y');
        $schedules = \DB::table('t_calendars as s')
            ->leftjoin('classes as cs', 'cs.id', '=', 's.class_id')
            ->leftjoin('teachers as t', 't.id', '=', 's.teacher_id')
            ->leftJoin('childs as ch','ch.class_id','=','t.class_id')
            ->leftJoin('users as u','ch.p_id','=','u.id')
            ->select('s.*', 'cs.name as class_name', 't.full_name as t_full_name', 't.first_name as t_first_name','t.last_name as t_last_name')
            ->where('u.id', $user->id)
            ->where('s.workingdate','>=', $today)
            ->where('s.is_deleted', 0)
//            ->whereNotIn('s.id', $bookidarray)
            ->orderby('s.workingdate', 'asc')
            ->get();
        //dd($schedules);
        return view('pages.user.home',compact('schedules','today','teacher'));
    }

    public function adminindex()
    {
        return view('pages.admin.home');
    }
    public function bookSlot(Request $request, $calendar_id){
        $calendar_id = $calendar_id;
        if($calendar_id == 0)
            return Redirect::back();

        $slots = \DB::table('t_calendar_slot as sl')
            ->leftJoin('parent_slot as ps', function($join){
                $join->on('sl.id','=','ps.slot_id');
                $join->where('is_deleted', 0);
            })
            ->leftJoin('t_calendars as ca','ca.id','=','sl.calendar_id')
            ->leftJoin('teachers as t','ca.teacher_id','=','t.id')
            ->leftJoin('m_prefix as pre','pre.id','=','t.prefix')
//            ->leftJoin('users as u', 'ps.parent_id', '=', 'u.id')
//            ->leftjoin('childs as c', 'c.p_id', '=', 'u.id')
            ->select('ps.id as appointment_id'
//                , 'u.*'
//                , 'c.full_name'
                ,'ps.created_at as appoint_date'
                ,'ps.is_deleted'
                ,'sl.id as slot_id'
				,'sl.order'
                ,'ps.parent_id'
                ,'ca.duration'
                ,'ca.app_from'
                ,'ca.app_to'
                ,'t.full_name as t_full_name'
				,'t.first_name as t_f_name'
				,'t.last_name as t_l_name'
                ,'pre.name as prefix'
            )
            ->where('ca.id', $calendar_id)
            ->orderby('sl.id')
            ->get();

        

        $user_id = Auth::user()->id;
        $class_id = \DB::table('t_calendars')->where('id', $calendar_id)->first()->class_id;
        $childs = \DB::table('childs')->where(['p_id'=> $user_id,'class_id'=>$class_id])->get();
        //dd($childs);
        return view('pages.user.bookingslot',compact('slots','user_id', 'childs'));
    }

    public function assignSlot(Request $request){
        $slot_id = $request->get('slot_id',0);
        $parent_id = $request->get('parent_id',0);
        $c_id = $request->get('c_id',0);
        if($slot_id == 0)
            return Redirect::back();
        if($parent_id == 0)
            $parent_id = Auth::user()->id;
        $keys = ['parent_id'=>$parent_id, 'slot_id'=>$slot_id];
        $data = ['parent_id'=>$parent_id, 'slot_id'=>$slot_id,'updated_at'=>date('Y-m-d H:i:s')];

        $user = ParentSlot::firstOrNew($keys);
        $user->parent_id = $parent_id;
        $user->slot_id = $slot_id;
        $user->is_deleted = 0;
        $user->c_id = $c_id;
        $user->updated_at = date('Y-m-d H:i:s');
        $user->save();

$email = Auth::user()->email;
  		$slot = \DB::table('t_calendar_slot as sl')
            ->leftJoin('parent_slot as ps', function($join){
                $join->on('sl.id','=','ps.slot_id');
                $join->where('is_deleted', 0);
            })
            ->leftJoin('t_calendars as ca','ca.id','=','sl.calendar_id')
            ->leftJoin('teachers as t','ca.teacher_id','=','t.id')
            ->leftJoin('m_prefix as pre','pre.id','=','t.prefix')
//            ->leftJoin('users as u', 'ps.parent_id', '=', 'u.id')
//            ->leftjoin('childs as c', 'c.p_id', '=', 'u.id')
            ->select('ps.id as appointment_id'
//                , 'u.*'
//                , 'c.full_name'
                ,'ps.created_at as appoint_date'
                ,'ps.is_deleted'
                ,'sl.id as slot_id'
				,'sl.order'
                ,'ps.parent_id'
                ,'ca.duration'
                ,'ca.app_from'
                ,'ca.app_to'
                ,'t.full_name as t_full_name'
				,'t.first_name as t_f_name'
				,'t.last_name as t_l_name'
                ,'pre.name as prefix'
            )
            ->where('sl.id', $slot_id)
            ->first();
		
		 if($slot->app_from > 12){
                                $app_from = $slot->app_from - 12;
                                $app_from = $app_from.' pm';
                            }else{
                                $app_from = $slot->app_from.' am';
                            }
                            if($slot->app_to > 12){
                                $app_to = $slot->app_to - 12;
                                $app_to = $app_to.' pm';
                            }else{
                                $app_to = $slot->app_to.' am';
                            }

                            $minutes = $slot->duration * ($slot->order -1);
                            $hour = ($minutes - ($minutes % 60))/60;
                            $start_hour = $slot->app_from + $hour;
                            $half = '';
                            if($start_hour > 12){
                                $start_hour = $start_hour - 12;
                                $half = 'pm';
                            }else{
                                $half = 'am';
                            }
                            $start_minute = $minutes % 60;
                            $start_minute = sprintf("%02d", $start_minute);
							
								require_once getcwd()."/php_mail/vendor/autoload.php";
		
								$mail = new PHPMailer;
								$mail->IsSMTP();                                      // Set mailer to use SMTP
								$mail->Host = 'mail.goqueens.co.uk';                 // Specify main and backup server
								$mail->Port = 587;                                    // Set the SMTP port
								$mail->SMTPAuth = true;                               // Enable SMTP authentication
								$mail->Username = 'parents@goqueens.co.uk';                // SMTP username
								$mail->Password = '!Jump3r1234!!';                  // SMTP password
								$mail->SMTPSecure = 'tls';         
								//From email address and name
								$mail->From = "parents@goqueens.co.uk";
								$mail->FromName = "Parents System.";
								
								//To address and name
								$mail->addAddress($email);
								$mail->isHTML(true);
								
								$mail->Subject = "Parent Slot Book";
								$mail->Body = "Hello, <p>Thank you for booking a time slot for parents evening.  Please log in to review the details. Many thanks.</p><p>Time:".$start_hour.":".$start_minute."  ".$half." - ".$slot->duration."min</p><p>Teacher Name: ".$slot->t_f_name." ".$slot->t_l_name."</p>";
								//$mail->AltBody = "This is the plain text version of the email content";
								if(!$mail->send()) 
								{
								//echo "Mailer Error: " . $mail->ErrorInfo;
								} 
								else 
								{
								//echo "Message has been sent successfully";
								}		
								
        // $booking_id = \DB::table('parent_slot')
        //     ->updateOrInsert($keys ,$data);
        // $ret = array();
        // $ret['book_id'] = $booking_id;
        $ret['code'] = 1;
        $ret['msg'] = 'Assign successfully!';
        return \GuzzleHttp\json_encode($ret);
    }

    public function StoreLog(ParentSlot $parentSlot, $type){
        $info = "--";

        app('log')->info("\r\n");
        app('log')->info($type.$info.$parentSlot."\r\n");
        app('log')->info("\r\n");
    }

//    go to parent booked schedule page
    public function showParentSlot(){
        $user = Auth::user();
        $bookslots = \DB::table('parent_slot as ps')
            ->leftJoin('t_calendar_slot as sl','sl.id','=','ps.slot_id')
            ->leftJoin('t_calendars as cal','sl.calendar_id','=','cal.id')
            ->leftjoin('classes as cs', 'cs.id', '=', 'cal.class_id')
            ->leftjoin('teachers as t', 't.id', '=', 'cal.teacher_id')
            ->leftJoin('m_prefix as pre','pre.id','=','t.prefix')
            ->select('cal.*', 'cs.name as class_name', 't.full_name as t_full_name','pre.name as t_prefix'
                , 't.first_name as t_first_name'
                ,'ps.created_at as c_p_slot'
                ,'ps.id as appointment_id'
                ,'sl.order'
                ,'cal.duration'
            )
            ->where('ps.is_deleted', 0)
            ->where('ps.parent_id',$user->id)
            ->orderby('cal.workingdate','asc')
            ->orderby('sl.order','asc')
            ->get()
        ;
        return view('pages.user.parentslot',compact('bookslots'));
    }
}
