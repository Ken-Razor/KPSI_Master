<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;


class Mahasiswa extends Authenticatable
{
	use Notifiable;
    protected $table = 'mahasiswa';
    protected $fillable = ['nama_mhs','email'];
}
