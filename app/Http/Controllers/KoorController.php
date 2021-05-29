<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Response;
use File;
use App\Koor;
use App\Dosen;
use App\Mahasiswa;
use App\User;

use App\Sk_kp;
use App\Pra_kp;
use App\Kp;
use App\Ajaran;


use Auth;

class KoorController extends Controller
{

    public function setajaran()
    {
        $dajaran = DB::SELECT("SELECT * FROM ajaran");
        return view('koor/setajaran', compact('dajaran'));
    }

    public function setajaranAct(Request $request)
    {
        $update = DB::table('ajaran')
        ->update(['semester' => $request->semester,
                        'tahun' => $request->tahun,
                        ]);
        return redirect('/koor/set/ajaran')->with('sukses-ubah','Wahh Ajaran berhasil diubah nih');

        
    }

    

    

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

        \Session::flash('sukses','status berhasil diubah');
        return redirect('koor/verifikasi_sk');

    }

    //PRA KP
    public function verifikasi_prakp()
    {
        
        $data = DB::select("SELECT * FROM pra_kp");
        $downloads = DB::table('pra_kp')->get();
        return view ('koor/verifikasi_prakp', compact('data','downloads'));
    }

    public function status_prakp($id)
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

        \Session::flash('sukses','status berhasil diubah');
        return redirect('koor/verifikasi_prakp');

    }

    //KP
    public function verifikasi_kp()
    {
        
        $data = DB::select("SELECT * FROM kp");
        $datapra = DB::select("SELECT * FROM kp");
        $downloads = DB::table('kp')->get();
        
        return view ('koor/verifikasi_kp', compact('data','downloads','datapra'));
    }

    public function status_kp($id)
    {
        $data = \DB::table('kp')->where('id', $id)->first();

        $status_sekarang = $data->status;

        if($status_sekarang == 1){
            \DB::table('kp')->where('id',$id)->update([
                'status'=>0
            ]);
        }else{
            \DB::table('kp')->where('id',$id)->update([
                'status'=>1
            ]);
        }

        \Session::flash('sukses','status berhasil diubah');
        return redirect('koor/verifikasi_kp');

    }

    // public function downsk($id)
    // {
    //     $down = Kp::findOrfail($id);
    //     return response()->download(storage_path('public/dok_kp/'. $down->file));
        
    // }

    // function getFile($filename){
            
    //     return view('koor/verifikasi_kp', compact('i'));
    // }

    





   



    
}
