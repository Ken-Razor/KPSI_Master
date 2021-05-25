<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Dosen;
use App\Mahasiswa;
use App\User;
use Auth;


class DosenController extends Controller
{
	// public function layout()
	// {
	// 	$id = Auth::user()->id;
 //        $data = DB::select("SELECT * FROM dosen WHERE id = '$id'");
 //        // var_dump($data);
 //    	return view('layout_dsn/dsn', compact('data'));
	// }

    public function index_dosen()
    {

            $id = Auth::guard('dosen')->user()->id;
            $data = DB::select("SELECT * FROM dosen WHERE id = '$id'");
            // var_dump($data);
    	   return view('dosen/index_dosen');
    }
}
