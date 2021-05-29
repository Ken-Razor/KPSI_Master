<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;


class Sk_kp extends Model
{
	use Notifiable;
     protected $table = 'sk_kp';
     protected $fillable = ['id_mhs','semester','tahun','nim','lembaga','pimpinan','no_telp','alamat','fax','dokumen','status'];


}
