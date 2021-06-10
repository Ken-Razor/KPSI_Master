<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Mahasiswa;
use App\User;
use App\Sk_kp;
use App\Pra_kp;
use App\Kp;
use App\Jadwal_ujian;
use App\Batas_kp;
use App\Ajaran;




use Auth;

class ApiKoor extends Controller
{
    public function verifikasi_sk()
    {
        

         return DB::SELECT("SELECT id, semester, tahun, nim,lembaga,pimpinan,no_telp,alamat,fax, dokumen, status, CASE
			WHEN status = 3 THEN 'Belum diverifikasi'
			WHEN status = 'null' THEN 'Ditolak'
			WHEN status = 1 THEN 'Disetujui'

			END AS status_ok from sk_kp");
    }

    public function status_sk($id)
    {
    	
        $data = \DB::table('sk_kp')->where('id', $id)->first();

        $status_sekarang = $data->status;

        if($status_sekarang == 1){
            \DB::table('sk_kp')->where('id',$id)->update([
                'status'=>0
            ]);
        }else{
            \DB::table('sk_kp')->where('id',$id)->update([
                'status'=>1
            ]);
        }

        return $status_sekarang;





        // \Session::flash('sukses','status berhasil diubah');
        // return redirect('koor/verifikasi_sk');

    }

     public function updateStatusSk(Request $request)
    {
        
       
    	$id = $request->id;
         return DB::table('sk_kp')
         	  ->where('id', $id)
              ->update(['semester' => $request->semester,
                        'tahun' => $request->tahun,
                        'nim' => $request->nim,
                        'lembaga' => $request->lembaga,
                        'pimpinan' => $request->pimpinan,
                        'no_telp' => $request->no_telp,
                        'alamat' => $request->alamat,
                        'fax' => $request->fax,
                        'dokumen' => $request->dokumen,
                        'status' => $request->status,
                        ]);

        
    }


    // public function status_sk($id)
    // {
        
    //     $data = \DB::table('kp')->where('id', $id)->first();

    //     $status_sekarang = $data->status;

    //     if($status_sekarang == 1){
    //         \DB::table('kp')->where('id',$id)->update([
    //             'status'=>0
    //         ]);
    //     }else{
    //         \DB::table('kp')->where('id',$id)->update([
    //             'status'=>1
    //         ]);
    //     }

    //     return $status_sekarang;





    //     // \Session::flash('sukses','status berhasil diubah');
    //     // return redirect('koor/verifikasi_sk');

    // }

    public function updateStatusPra(Request $request)
    {
        
       
    	$id = $request->id;
         return DB::table('pra_kp')
         	->where('id', $id)
              ->update(['semester' => $request->semester,
                        'tahun' => $request->tahun,
                        'nim' => $request->nim,
                        'nik' => $request->nik,
                        'tools' => $request->tools,
                        'spesifikasi' => $request->spesifikasi,
                        'penguji' => $request->penguji,
                        'ruang' => $request->ruang,
                        'lembaga' => $request->lembaga,
                        'pimpinan' => $request->pimpinan,
                        'no_telp' => $request->no_telp,
                        'alamat' => $request->alamat,
                        'dokumen' => $request->dokumen,
                        'status' => $request->status,
                        ]);

        
    }

    public function updateStatusKp(Request $request)
    {
        
       
    	$id = $request->id;
         return DB::table('kp')
         	->where('id', $id)
              ->update(['semester' => $request->semester,
                        'tahun' => $request->tahun,
                        'nim' => $request->nim,
                        'nik' => $request->nik,
                        'judul' => $request->judul,
                        'tools' => $request->tools,
                        'spesifikasi' => $request->spesifikasi,
                        'penguji' => $request->penguji,
                        'ruang' => $request->ruang,
                        'lembaga' => $request->lembaga,
                        'pimpinan' => $request->pimpinan,
                        'no_telp' => $request->no_telp,
                        'alamat' => $request->alamat,
                        'dokumen' => $request->dokumen,
                        'status' => $request->status,
                        ]);

        
    }

    public function verifikasi_pra()
    {
        $data = DB::SELECT("SELECT id,semester, tahun, nim,nik,tools,spesifikasi,penguji,ruang,lembaga, pimpinan, no_telp,alamat,dokumen,status, CASE
			WHEN status = 3 THEN 'Belum diverifikasi'
			WHEN status = 'null' THEN 'Ditolak'
			WHEN status = 1 THEN 'Disetujui'

			END AS status_ok from pra_kp ");
        return $data;
    }

    public function status_pra($id)
    {
    	
        $data = \DB::table('pra_kp')->where('id', $id)->first();

        $status_sekarang = $data->status;

        if($status_sekarang == 1){
            \DB::table('pra_kp')->where('id',$id)->update([
                'status'=>0
            ]);
        }else{
            \DB::table('pra_kp')->where('id',$id)->update([
                'status'=>1
            ]);
        }

        return $status_sekarang;

        // \Session::flash('sukses','status berhasil diubah');
        // return redirect('koor/verifikasi_sk');

    }


    public function verifikasi_kp()
    {
        $data = DB::SELECT("SELECT id, semester, tahun, nim,nik,judul,tools,spesifikasi,penguji,ruang,lembaga, pimpinan, no_telp,alamat,dokumen,status, CASE
			WHEN status = 3 THEN 'Belum diverifikasi'
			WHEN status = 'null' THEN 'Ditolak'
			WHEN status = 1 THEN 'Disetujui'

			END AS status_ok from kp ");
        return $data;
    }

    public function penjadwalan_ujian()
    {
        return DB::select("SELECT  id, semester, tahun, nim,nik,judul,tools,spesifikasi,penguji,ruang,lembaga, pimpinan, no_telp,alamat,dokumen,status, CASE WHEN status = 1 THEN 'Disetujui' END AS status_ok FROM kp WHERE status='1'");
        
    }

    public function form_penjadwalan_ujian(Request $request)
    {
        $id = $request->id;
        return DB::select("SELECT * FROM kp WHERE id='$id'");
        // $ddosen = DB::SELECT("SELECT * FROM dosen"); 
        // return view('/koor/form_penjadwalan_ujian', compact('data','ddosen'));
    }

    public function form_penjadwalan_ujian_act(Request $request)
    {
        
        $id = $request->id;
        return DB::table('jadwal_ujian')
              ->where('id', $id)
              ->insert([
                'nim' => $request->nim,
                'dosbing' => $request->dosbing,
                'dosuji' => $request->dosuji,
                'tanggal' => $request->tanggal,
                'jam' => $request->jam,
                'ruangan' => $request->ruangan
                        ]);

        
    }

    public function jadwal_ujian_koor()
    {
        
        return DB::select("SELECT * FROM jadwal_ujian");
        // $ddosen = DB::SELECT("SELECT * FROM dosen"); 
        // return view('/koor/form_penjadwalan_ujian', compact('data','ddosen'));
    }

    // public function form_batas_pelaksanaan_act(Request $request)
    // {
    //     return Batas_kp::create($request->all());
         
    // }

    public function batas_kp()
    {
        return DB::SELECT("SELECT * FROM batas_kp");
    }

    public function form_ubah_batas_pelaksanaan_act(Request $request)
    {
         $id = $request->id;

         return DB::table('batas_kp')
            ->where('id', $id)
              ->update(['mulai' => $request->mulai,
                        'batas' => $request->batas,
                        ]);
       
    }

    public function setajaran()
    {
        return DB::SELECT("SELECT * FROM ajaran");
        
    }

    public function setajaranAct(Request $request)
    {
        return DB::table('ajaran')
        ->update(['semester' => $request->semester,
                        'tahun' => $request->tahun,
                        ]);    
    }


   

     public function melihat_daftar_registrasi()
    {
        return DB::select("SELECT * FROM kp WHERE status='1'");
    }








   
}
