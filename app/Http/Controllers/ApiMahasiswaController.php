<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Mahasiswa;
use App\User;
use App\Sk_kp;
use App\Pra_kp;
use App\Kp;




use Auth;

class ApiMahasiswaController extends Controller
{

	public function index(Request $request, $id){
    	$id = $request->id;
     return DB::SELECT("SELECT * FROM mahasiswa WHERE id = '$id'");
    }

    public function sk_kp_mhs(Request $request, $id)
    {
        $id = $request->id;

        
        // return DB::SELECT("SELECT * FROM sk_kp WHERE id_mhs='$id'");
        return DB::SELECT("SELECT semester, tahun, nim,lembaga,pimpinan,no_telp,alamat,fax, dokumen, status, CASE
			WHEN status = 3 THEN 'Belum diverifikasi'
			WHEN status = 'null' THEN 'Ditolak'
			WHEN status = 1 THEN 'Disetujui'

			END AS status_ok from sk_kp WHERE id_mhs='$id'");
       
    	
    }

    public function sk_kp_mhs_act(Request $request, $id)
    {
    	$id = $request->id;
    	return DB::table('sk_kp')
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
                'dokumen' => $request->dokumen
                        ]);
    }


    public function pra_kp_mhs(Request $request, $id)
    {
        $id = $request->id;
        // return DB::SELECT("SELECT * FROM pra_kp WHERE id_mhs='$id'");
        $data = DB::SELECT("SELECT semester, tahun, nim,nik,tools,spesifikasi,penguji,ruang,lembaga, pimpinan, no_telp,alamat,dokumen,status, CASE
			WHEN status = 3 THEN 'Belum diverifikasi'
			WHEN status = 'null' THEN 'Ditolak'
			WHEN status = 1 THEN 'Disetujui'

			END AS status_ok from pra_kp WHERE id_mhs='$id'");
        return $data;
        
    }

    public function pra_kp_mhs_act(Request $request, $id)
    {

        $id = $request->id;
       

         	return DB::table('pra_kp')
              ->where('id', $id)
              ->insert([
                'id_mhs' => $id,
                'semester' => $request->semester,
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
                'dokumen' => $request->dokumen
                        ]);
          
    }


    public function kp_mhs(Request $request, $id)
    {
    	$id = $request->id;
         
   //      $datapra = DB::SELECT("SELECT semester, tahun, nim,nik,tools,spesifikasi,penguji,ruang,lembaga, pimpinan, no_telp,alamat,dokumen,status, CASE
			// WHEN status = 3 THEN 'Belum diverifikasi'
			// WHEN status = 'null' THEN 'Ditolak'
			// WHEN status = 1 THEN 'Disetujui'
			// END AS status_ok from pra_kp WHERE id_mhs='$id'");

        $datakp = DB::SELECT("SELECT semester, tahun, nim,nik,judul,tools,spesifikasi,penguji,ruang,lembaga, pimpinan, no_telp,alamat,dokumen,status, CASE
			WHEN status = 3 THEN 'Belum diverifikasi'
			WHEN status = 'null' THEN 'Ditolak'
			WHEN status = 1 THEN 'Disetujui'
			END AS status_ok from kp WHERE id_mhs='$id'");

        // $dajaran = DB::SELECT("SELECT * FROM ajaran");
       	return $datakp;
    }

     public function kp_mhs_act(Request $request, $id)
    {
        
    		$id = $request->id;
            return DB::table('kp')
              ->where('id', $id)
              ->insert([
                'id_mhs' => $id,
                'semester' => $request->semester,
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
                'dokumen' => $request->dokumen
                        ]);
         
    }


    public function lihat_jadwal_for_mahasiswa(Request $request, $nim)
    {
        $nim = $request->route('nim');
        $jadwal = DB::select("SELECT * FROM jadwal_ujian WHERE nim='$nim'");
        $dkp = DB::select("SELECT * FROM kp WHERE nim='$nim'");
        return compact('jadwal','dkp');
    }

   


    
}
