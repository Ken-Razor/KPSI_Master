<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;

class Jadwal_ujian extends Model
{
    use Notifiable;
 	
    protected $table = 'jadwal_ujian';
    protected $fillable = ['nim','dosbing','dosuji','tanggal','jam','ruangan'];
}
