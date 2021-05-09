<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Mahasiswa;

use Auth;

class MahasiswaController extends Controller
{
    public function index_mhs()
    {
    	
    	
    	return view ('mahasiswa/index_mhs');
    }

    public function sk_kp_mhs()
    {
    	return view('mahasiswa/sk_kp_mhs');
    }
    public function pra_kp_mhs()
    {
    	return view('mahasiswa/pra_kp_mhs');
    }
    public function kp_mhs()
    {
    	return view('mahasiswa/kp_mhs');
    }

}
