<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Dosen;
use App\Mahasiswa;
use App\User;
use Auth;

use App\Jadwal_ujian;


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

    public function dataBimbingan()
    {
        $id = Auth::guard('dosen')->user()->nama_dosen;

        $data = DB::select("SELECT DISTINCT nim FROM jadwal_ujian 
            WHERE dosbing='$id'");

        // var_dump($data);
        return view('dosen/data_bimbingan',compact('data'));
        
    }

    public function dataUjian()
    {
        $id = Auth::guard('dosen')->user()->nama_dosen;
        
        $data = DB::select("SELECT DISTINCT nim, dosbing,dosuji, tanggal, jam, ruangan FROM jadwal_ujian WHERE dosbing='$id'");
        return view('dosen/jadwal_ujian',compact('data'));
    }
}
