<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('ajaran','ApiAjaranController@index');
Route::post('ajaran','ApiAjaranController@create');
Route::put('/ajaran/{id}','ApiAjaranController@update');

Route::get('dosen/{id}','ApiDosenController@index');
Route::get('dosen/bimbingan/{id}','ApiDosenController@dataBimbingan');
Route::get('dosen/ujian/{id}','ApiDosenController@dataUjian');


Route::get('mahasiswa/{id}','ApiMahasiswaController@index');

//SK
Route::get('mahasiswa/sk/{id}','ApiMahasiswaController@sk_kp_mhs');
Route::post('mahasiswa/tambah/{id}','ApiMahasiswaController@sk_kp_mhs_act');


//PRA
Route::get('mahasiswa/pra/{id}','ApiMahasiswaController@pra_kp_mhs');
Route::post('mahasiswa/tambah/pra/{id}','ApiMahasiswaController@pra_kp_mhs_act');

//KP
Route::get('mahasiswa/kp/{id}','ApiMahasiswaController@kp_mhs');
Route::post('mahasiswa/tambah/kp/{id}','ApiMahasiswaController@kp_mhs_act');


//JADWAL
Route::get('/mahasiswa/tgl_ujian/{nim}','ApiMahasiswaController@lihat_jadwal_for_mahasiswa');



//KOOR SK
Route::get('/koor/verifikasi/sk','ApiKoor@verifikasi_sk');
Route::post('/koor/verifikasi/sk/status/{id}','ApiKoor@status_sk');
Route::put('/koor/verifikasi/sk/status/update','ApiKoor@updateStatusSk');

//KOOR PRA
Route::get('/koor/verifikasi/pra','ApiKoor@verifikasi_pra');
Route::post('/koor/verifikasi/pra/status/{id}','ApiKoor@status_pra');
Route::put('/koor/verifikasi/pra/status/update','ApiKoor@updateStatusPra');

//KOOR KP
Route::get('/koor/verifikasi/kp','ApiKoor@verifikasi_kp');
Route::post('/koor/verifikasi/kp/status/{id}','ApiKoor@status_kp');
Route::put('/koor/verifikasi/kp/status/update','ApiKoor@updateStatusKp');


//JADWAL
Route::get('/koor/jadwal/kp','ApiKoor@penjadwalan_ujian');
Route::get('/koor/jadwal/ujian','ApiKoor@jadwal_ujian_koor');

Route::put('/koor/atur/jadwal/ujian','ApiKoor@form_penjadwalan_ujian');

Route::post('/koor/atur/jadwal/ujian/simpan','ApiKoor@form_penjadwalan_ujian_act');


//Melihat daftar registrasi
Route::get('koor/lihat/daftar/registrasi','ApiKoor@melihat_daftar_registrasi');


//batas kp
Route::get('/koor/batas/kp','ApiKoor@batas_kp');
Route::put('/koor/ubah/batas/pelaksaan/kp','ApiKoor@form_ubah_batas_pelaksanaan_act');

//AJARAN
Route::get('/koor/set/ajaran','ApiKoor@setajaran');
Route::put('/koor/set/ajaran/ubah','ApiKoor@setajaranAct');






