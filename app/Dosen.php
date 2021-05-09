<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Dosen extends Authenticatable
{

	use Notifiable;
 	protected $guard = 'dosen';
    protected $table = 'dosen';
    protected $fillable = ['nama_dosen','email_dosen'];
}
