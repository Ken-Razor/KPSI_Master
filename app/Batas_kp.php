<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Batas_kp extends Model
{
    use Notifiable;
 	
    protected $table = 'batas_kp';
    protected $fillable = ['mulai','batas','status'];
}
