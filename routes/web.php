<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('login');
});

// Auth::login();



Route::get('/redirect', 'loginGoogleController@redirect');
Route::get('/callback', 'loginGoogleController@callback');
Route::get('/logout', 'loginGoogleController@logout');


Route::get('/mhs/index_mhs','MahasiswaController@index_mhs');

Route::get('/mhs/pengajuan_sk_kp','MahasiswaController@sk_kp_mhs');
Route::get('/mhs/pengajuan_pra_kp','MahasiswaController@pra_kp_mhs');
Route::get('/mhs/pengajuan_kp','MahasiswaController@kp_mhs');
Route::get('/mhs/tgl_ujian','MahasiswaController@tgl_ujian');
Route::get('/mhs/profile/{id}','MahasiswaController@updateProfile');
Route::put('/updateProfileAct','MahasiswaController@updateProfileAct');


Route::post('/mhs/tambah/sk','MahasiswaController@sk_kp_mhs_act');


Route::get('/data','MahasiswaController@data');

Route::post('/mhs/tambah/prakp','MahasiswaController@pra_kp_mhs_act');

Route::post('/mhs/tambah/kp','MahasiswaController@kp_mhs_act');





Route::get('/dosen/index_dosen', function () {
    return view('dosen/index_dosen');
});

Route::get('/dosen/daftar_bimbingan', function () {
    return view('dosen/data_bimbingan');
});

Route::get('/dosen/jadwal_ujian', function () {
    return view('dosen/jadwal_ujian');
});


Route::get('/koor/index_koor', function () {
    return view('koor/index_koor');
});
