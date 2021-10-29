<?php
/**
 * Created by PhpStorm.
 * User: info124
 * Date: 8/21/2019
 * Time: 2:55 PM
 */

namespace App\Request;
use Illuminate\Foundation\Http\FormRequest;


class ClassesRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
					'pupil_forename'=>'required',
					'pupil_surname'=>'required',
					'class'=>'required',
					'parent_forename'=>'required',
					'parent_surname'=>'required',
        ];
    }

    public function rules2(){
        return [
            'parents_first_name' => 'required'
            
        ];
    }

    /**
     * Validation messages
     *
     * @return array
     */
    public function messages()
    {
        return [
            'name.required' => __("Please enter b_name."),
        ];
    }
}
