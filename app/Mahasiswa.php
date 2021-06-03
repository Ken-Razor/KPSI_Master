<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;


class Mahasiswa extends Authenticatable
{
	use Notifiable;
    protected $table = 'mahasiswa';

     protected $guard = 'mahasiswa';
    // protected $fillable = ['google_id','nama_mhs','email'];
    protected $fillable = ['nim','nama_mhs','email','jenis_kelamin','no_telp_mhs','sks'];
}
