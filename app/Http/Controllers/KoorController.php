<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Koor;
use App\Dosen;
use App\Mahasiswa;
use App\User;

use App\Sk_kp;

use Auth;

class KoorController extends Controller
{
    public function index_koor()
    {
        $id = Auth::guard('koor')->user()->id;
            $data = DB::select("SELECT * FROM koor WHERE id = '$id'");
            // var_dump($data);
    	return view('koor/index_koor');
    }

    public function verifikasi_sk()
    {
        
        $data = DB::select("SELECT * FROM sk_kp");
        $downloads = DB::table('sk_kp')->get();
        return view ('koor/verifikasi_sk', compact('data','downloads'));
    }





   



    
}
