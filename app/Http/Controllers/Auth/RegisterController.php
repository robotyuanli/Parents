<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Traits\ActivationTrait;
use App\Traits\CaptchaTrait;
use App\Traits\CaptureIpTrait;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use jeremykenedy\LaravelRoles\Models\Role;
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;
class RegisterController extends Controller
{


    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
     */

    use ActivationTrait;
    use CaptchaTrait;
    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/activate';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
	
        $this->middleware('guest', [
            'except' => 'logout',
        ]);
		
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param array $data
     *
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        $data['captcha'] = $this->captchaCheck();

        if (!config('settings.reCaptchStatus')) {
            $data['captcha'] = true;
        }

        return Validator::make($data,
            [
                'name'                  => 'required|unique:users',
                'first_name'            => 'required',
                'last_name'             => 'required',
                'email'                 => 'required|email|max:255|unique:users',
                'password'              => 'required|min:6|max:30|confirmed',
                'password_confirmation' => 'required|same:password',
            ],
            [
                'name.unique'                   => trans('auth.userNameTaken'),
                'name.required'                 => trans('auth.userNameRequired'),
                'first_name.required'           => trans('auth.fNameRequired'),
                'last_name.required'            => trans('auth.lNameRequired'),
                'email.required'                => trans('auth.emailRequired'),
                'email.email'                   => trans('auth.emailInvalid'),
                'password.required'             => trans('auth.passwordRequired'),
                'password.min'                  => trans('auth.PasswordMin'),
                'password.max'                  => trans('auth.PasswordMax'),
            ]
        );
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param array $data
     *
     * @return User
     */

    protected function create(array $data)
    {
	
	
        $ipAddress = new CaptureIpTrait();
        $role = Role::where('slug', '=', 'user')->first();

        $user = User::create([
                'name'              => $data['last_name'].$data['first_name'],
                'first_name'        => $data['first_name'],
                'last_name'         => $data['last_name'],
                'email'             => $data['email'],
                'password'          => Hash::make($data['password']),
                'token'             => str_random(64),
                'signup_ip_address' => $ipAddress->getClientIp(),
                'activated'         => 1,
            ]);

        $user->attachRole($role);

        if($data['c_first_name'] != '' || $data['c_last_name'] != ''){
            \DB::table('childs')->insert([
                'full_name'              => $data['c_last_name'].$data['c_first_name'],
                'first_name'        => $data['c_first_name'],
                'last_name'         => $data['c_last_name'],
                'class_id'             => $data['class_id'],
                'p_id'             => $user->id,
            ]);
        }
		
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
								$mail->addAddress($data['email']);
								$mail->isHTML(true);
								
								$mail->Subject = "Parent Register";
								$mail->Body = "Hello, ".$data['first_name']." ".$data['last_name']."<p>Thank you for registering with Queens, Please see below for your log on information.</p><p>Email: ".$data['email']."</p><p>Password: ".$data['password']."</p><p>Any problems please contact the school office on 02476 382 906</p>";
								//$mail->AltBody = "This is the plain text version of the email content";
								if(!$mail->send()) 
								{
								echo "Mailer Error: " . $mail->ErrorInfo;
								} 
								else 
								{
								echo "Message has been sent successfully";
								}				
								
        //$this->initiateEmailActivation($user);
        return $user;
    }
}
