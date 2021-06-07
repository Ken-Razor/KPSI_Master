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



