<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ParentSlot extends Model
{
    /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'parent_slot';

    /**
     * The attributes that are not mass assignable.
     *
     * @var array
     */
    protected $guarded = [
        'id',
    ];

    
}
