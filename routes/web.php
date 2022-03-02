<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
| Middleware options can be located in `app/Http/Kernel.php`
|
*/


// Homepage Route
Route::get('/', 'WelcomeController@welcome')->name('welcome');

// Calendar Slot Add
Route::get('/pupilslot/{parent_link}', 'WelcomeController@showPupilSlot');

// Authentication Routes
Auth::routes();

// Public Routes
Route::group(['middleware' => ['web', 'activity']], function () {
    $this->get('adminlogin', 'Auth\LoginController@showadminLoginForm')->name('adminlogin');
    $this->post('adminlogin', 'Auth\LoginController@adminlogin');
    $this->post('adminlogout', 'Auth\LoginController@logout')->name('adminlogout');

    // Activation Routes
    Route::get('/activate', ['as' => 'activate', 'uses' => 'Auth\ActivateController@initial']);

    Route::get('/activate/{token}', ['as' => 'authenticated.activate', 'uses' => 'Auth\ActivateController@activate']);
    Route::get('/activation', ['as' => 'authenticated.activation-resend', 'uses' => 'Auth\ActivateController@resend']);
    Route::get('/exceeded', ['as' => 'exceeded', 'uses' => 'Auth\ActivateController@exceeded']);

    // Socialite Register Routes
    Route::get('/social/redirect/{provider}', ['as' => 'social.redirect', 'uses' => 'Auth\SocialController@getSocialRedirect']);
    Route::get('/social/handle/{provider}', ['as' => 'social.handle', 'uses' => 'Auth\SocialController@getSocialHandle']);

    // Route to for user to reactivate their user deleted account.
    Route::get('/re-activate/{token}', ['as' => 'user.reactivate', 'uses' => 'RestoreUserController@userReActivate']);
});

// Registered and Activated User Routes
Route::group(['middleware' => ['auth', 'activated', 'activity']], function () {

    // Activation Routes
    Route::get('/activation-required', ['uses' => 'Auth\ActivateController@activationRequired'])->name('activation-required');
    Route::get('/logout', ['uses' => 'Auth\LoginController@logout'])->name('logout');
});

// Registered and Activated User Routes
Route::group(['middleware' => ['auth', 'activated', 'activity', 'twostep']], function () {

    //  Homepage Route - Redirect based on user role is in controller.
    Route::get('/home', ['as' => 'public.home',   'uses' => 'UserController@index']);
    Route::any('/home/bookSchedule', ['as' => 'public.home.bookschedule',   'uses' => 'UserController@assignSlot']);
    Route::any('/home/bookslot/{calendar_id}', ['as' => 'public.home.bookslot',   'uses' => 'UserController@bookSlot']);
    Route::get('/parentslot', ['as' => 'public.home.parentslot',   'uses' => 'UserController@showParentSlot']);
    Route::get('/appointment/delete/{appointment_id}', ['as' => 'appointment.delete',   'uses' => 'AdminController@deleteAppointment']);

    // Show users profile - viewable by other users.
    Route::get('profile/{username}', [
        'as'   => '{username}',
        'uses' => 'ProfilesController@show',
    ]);
});

// Registered, activated, and is current user routes.
Route::group(['middleware' => ['auth', 'activated', 'currentUser', 'activity', 'twostep']], function () {

    // User Profile and Account Routes
    Route::resource(
        'profile',
        'ProfilesController', [
            'only' => [
                'show',
                'edit',
                'update',
                'create',
            ],
        ]
    );
    Route::put('profile/{username}/updateUserAccount', [
        'as'   => '{username}',
        'uses' => 'ProfilesController@updateUserAccount',
    ]);
    Route::put('profile/{username}/updateUserPassword', [
        'as'   => '{username}',
        'uses' => 'ProfilesController@updateUserPassword',
    ]);
    Route::delete('profile/{username}/deleteUserAccount', [
        'as'   => '{username}',
        'uses' => 'ProfilesController@deleteUserAccount',
    ]);

    // Route to show user avatar
    Route::get('images/profile/{id}/avatar/{image}', [
        'uses' => 'ProfilesController@userProfileAvatar',
    ]);

    // Route to upload user avatar.
    Route::post('avatar/upload', ['as' => 'avatar.upload', 'uses' => 'ProfilesController@upload']);
});

// Registered, activated, and is admin routes.
Route::group(['middleware' => ['auth', 'activated', 'role:admin', 'activity', 'twostep']], function () {
    Route::get('/adminhome', ['as' => 'public.adminhome',   'uses' => 'UserController@adminindex']);
    Route::get('/addcalendar', ['as' => 'addcalendar',   'uses' => 'AdminController@addcalendar']);
    Route::post('/addcalendar', ['as' => 'addcalendar',   'uses' => 'AdminController@storecalendar']);
    Route::post('/deletecalendar', ['as' => 'deletecalendar',   'uses' => 'AdminController@deletecalendar']);
    Route::get('/calendarappointment/{calendar_id}', ['as' => 'calendarappointment',   'uses' => 'AdminController@showCalendarAppointment']);
//    Route::get('/appointment/delete/{appointment_id}', ['as' => 'appointment.delete',   'uses' => 'AdminController@deleteAppointment']);
    Route::get('/manageusers', ['as' => 'manageusers',   'uses' => 'AdminController@manageusers']);
    Route::get('/manageparents', ['as' => 'manageparents',   'uses' => 'AdminController@manageparents']);
    Route::get('/parent/edit/{id}',  'AdminController@editparent');
	
		Route::get('/parent/add/',  'AdminController@addparent');
		Route::post('/parent/addparent1/',  'AdminController@addparent1');
	
		Route::get('/parent/delete/{id}',  'AdminController@deleteparent');
		Route::get('/parentlinks',  'AdminController@parentlinks');
		Route::get('/parentnoemail',  'AdminController@parentnoemail');
		Route::get('/manage/{name}',  'AdminController@manageparentlinks');
		Route::any('/generate/links', ['as' => 'generate.links', 'uses' => 'AdminController@generateLinks']);
    Route::any('/export/csv', ['as' => 'export.csv', 'uses' => 'AdminController@exportCsv']);
    Route::any('/send/emails', ['as' => 'send.emails', 'uses' => 'AdminController@sendEmails']);
    Route::any('/delete/datas', ['as' => 'delete.datas', 'uses' => 'AdminController@deleteDatas']);
    Route::post('/editparent', ['as' => 'editparent',   'uses' => 'AdminController@updateparent']);
    Route::post('/updateemail', ['as' => 'updateemail',   'uses' => 'AdminController@updateEmail']);
    Route::get('/manageteachers', ['as' => 'manageteachers',   'uses' => 'AdminController@manageteachers']);
    Route::get('/teacher/edit/{id}',  'AdminController@editteacher');
    Route::get('/teacher/calendar/{id}',  'AdminController@showTeacherCalendar');
    Route::get('/calendar/parent/{id}',  'AdminController@showCalendarParent');
    Route::get('/schedules',  'AdminController@showSchedules');
    Route::get('/update/email',  'AdminController@showEmail');
    Route::get('/teacher/add',  'AdminController@addteacher');
    Route::get('/teacher/delete/{id}',  'AdminController@deleteteacher');
    Route::post('/editteacher', ['as' => 'editteacher',   'uses' => 'AdminController@updateteacher']);
    Route::post('/addteacher', ['as' => 'addteacher',   'uses' => 'AdminController@storeteacher']);
    Route::get('/managepupils/{class_id}', ['as' => 'managepupils',   'uses' => 'AdminController@managepupils']);
    Route::get('/pupil/edit/{id}',  'AdminController@editpupil');
    Route::get('/pupil/add',  'AdminController@addpupil');
    Route::get('/import/class',  'AdminController@importClass');
    Route::get('/import/parents',  'AdminController@importParents');
    Route::post('/import/class/file',  'AdminController@importClassFromFile');
    Route::post('/import/parents/file',  'AdminController@importParentsFromFile');
    Route::get('/pupil/delete/{id}',  'AdminController@deletepupil');
    Route::post('/editpupil', ['as' => 'editpupil',   'uses' => 'AdminController@updatepupil']);
    Route::post('/addpupil', ['as' => 'addpupil',   'uses' => 'AdminController@storepupil']);
    Route::get('/managecalendars',  'AdminController@managecalendars');
    Route::resource('/users/deleted', 'SoftDeletesController', [
        'only' => [
            'index', 'show', 'update', 'destroy',
        ],
    ]);

    Route::resource('users', 'UsersManagementController', [
        'names' => [
            'index'   => 'users',
            'destroy' => 'user.destroy',
        ],
        'except' => [
            'deleted',
        ],
    ]);

    Route::post('search-users', 'UsersManagementController@search')->name('search-users');

    Route::resource('themes', 'ThemesManagementController', [
        'names' => [
            'index'   => 'themes',
            'destroy' => 'themes.destroy',
        ],
    ]);

    Route::get('logs', '\Rap2hpoutre\LaravelLogViewer\LogViewerController@index');
    Route::get('routes', 'AdminDetailsController@listRoutes');
    Route::get('active-users', 'AdminDetailsController@activeUsers');
});

Route::redirect('/php', '/phpinfo', 301);
