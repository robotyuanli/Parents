<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\DB;

class WelcomeController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function welcome()
    {
        if(Auth::check()){
            $user = Auth::user();
            if ($user->isAdmin()) {
                return \Redirect::to('/adminhome');
            }
        }
        return view('welcome');
    }
    public function parentslot()
    {
        return view('pages.user.parentslot');
		}
		public function showPupilSlot($parent_id) {
			$data = DB::table('parent_links')->where('id', $parent_id)->get();
			$calendar_id = $data[0]->c_id;
			$parent_id = $data[0]->parent_id;
			
			$data = DB::table('t_calendars')->where('id', $calendar_id)->get();
			$workingdate = $data[0]->workingdate;
			$workingdate = str_replace("-", "/", $workingdate);

			$children = DB::table('t_calendars as ca')
						->leftJoin('teachers as te','ca.teacher_id','=','te.id')
						->leftJoin('childs as ch','te.class_id','=','ch.class_id')
						->leftJoin('users as u','u.id','=','ch.p_id')
						->select('ch.first_name', 'ch.last_name', 'ch.id', 'ch.p_id')
						->where('ca.id', $calendar_id)
						->where('ch.p_id', $parent_id)
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
			return view('pupilslot',compact('slots','children', 'calendar_id', 'workingdate'));
		}
}
