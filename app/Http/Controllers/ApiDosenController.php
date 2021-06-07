<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Dosen;
use App\Mahasiswa;
use App\User;
use Auth;

use App\Jadwal_ujian;

class ApiDosenController extends Controller
{
   



    public function index(Request $request, $id){
    	$id = $request->id;
     return DB::SELECT("SELECT * FROM dosen WHERE id = '$id'");
    }

    public function dataBimbingan(Request $request, $id)
    {
        $id = $request->id;

        
        return DB::select("SELECT DISTINCT nim FROM jadwal_ujian 
            WHERE dosbing='$id'");
        
    }

    public function dataUjian(Request $request, $id)
    {
         $id = $request->id;
        return DB::select("SELECT DISTINCT nim, dosbing,dosuji, tanggal, jam, ruangan FROM jadwal_ujian WHERE dosbing='$id'");
    }
}
