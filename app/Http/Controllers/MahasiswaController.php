<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Mahasiswa;
use App\User;

use Auth;

class MahasiswaController extends Controller
{

    // membuat session
    // public function index_mhs(Request $request) {
    //     $data = $request->session()->mahasiswa()->nama_mhs;
    //     print_r($data);
    // }

    

    
   

    public function index_mhs()
    {
    	
        $id = Auth::user()->id;
        $data = DB::select("SELECT * FROM mahasiswa WHERE id = '$id'");
    	return view ('mahasiswa/index_mhs', compact('data'));
    }

    public function updateProfile($id)
    {
        return view('mahasiswa/profile');
    }

    public function updateProfileAct(Request $request)
    {
        $id = Auth::user()->id;
       

         $update = DB::table('mahasiswa')
              ->where('id', $id)
              ->update(['nim' => $request->nim,
                        'nama_mhs' => $request->nama_mhs,
                        'jenis_kelamin' => $request->jenis_kelamin,
                        'email' => $request->email,
                        'no_telp_mhs' => $request->no_telp_mhs,
                        'sks' => $request->sks,
                        ]);

        return redirect('/mhs/index_mhs')->with('sukses-ubah','Wahh Profil berhasil diubah nih');
    }

    public function sk_kp_mhs()
    {
        $id = Auth::user()->id;
        $datask = DB::SELECT("SELECT * FROM sk_kp WHERE id_mhs='$id'");
        
        return view('mahasiswa/sk_kp_mhs', compact('datask'));
    	
    }

    public function sk_kp_mhs_act(Request $request)
    {
        $id = Auth::user()->id;

        if($request->hasFile('dokumen')){
            $resorce  = $request->file('dokumen');
            $name   = $resorce->getClientOriginalName();
            $resorce->move(\base_path() ."/public/dok_sk", $name);

            $update = DB::table('sk_kp')
              ->where('id', $id)
              ->insert([
                'id_mhs' => $id,
                'semester' => $request->semester,
                'tahun' => $request->tahun,
                'nim' => $request->nim,
                'lembaga' => $request->lembaga,
                'pimpinan' => $request->pimpinan,
                'no_telp' => $request->no_telp,
                'alamat' => $request->alamat,
                'fax' => $request->fax,
                'dokumen' => $name
                        ]);


            echo "Gambar berhasil di upload";
        }else{
            echo "Gagal upload gambar";
        }
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
