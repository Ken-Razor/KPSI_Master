<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
class Ajaran extends Model
{
	use Notifiable;
    protected $table = 'ajaran';
     protected $fillable = ['semester','tahun'];
}
