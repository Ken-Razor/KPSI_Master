<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ajaran;

class ApiAjaranController extends Controller
{
    public function index(){
     return Ajaran::all();
    }

     public function create(Request $request){
     $ajaran = new Ajaran;
     $ajaran->semester = $request->semester;
     $ajaran->tahun = $request->tahun;
     $ajaran->save();
     return "Data berhasil ditambahkan";
    }

    public function update(Request $request, $id){
     $semester = $request->semester;
     $tahun = $request->tahun;
     $ajaran = Ajaran::find($id);
     $ajaran->semester = $semester;
     $ajaran->tahun = $tahun;
     $ajaran->save();
     return "Data berhasil diubah";
    }


}
