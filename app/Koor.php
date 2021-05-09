<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Koor extends Authenticatable
{

	use Notifiable;
 	protected $guard = 'koor';
    protected $table = 'koor';
    protected $fillable = ['nama_koor','email_koor'];
}
