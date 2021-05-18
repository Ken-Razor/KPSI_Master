<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Pra_kp extends Model
{
    use Notifiable;
     protected $table = 'pra_kp';
     protected $fillable = ['id_mhs','semester','tahun','nim','lembaga','pimpinan','no_telp','alamat','dokumen','nik','tools','spesifikasi','penguji','ruang'];
}
