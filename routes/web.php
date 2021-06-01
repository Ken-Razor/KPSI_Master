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
Route::get('/mhs/tgl_ujian/{nim}','MahasiswaController@lihat_jadwal_for_mahasiswa');
Route::get('/mhs/profile/{id}','MahasiswaController@updateProfile');
Route::put('/updateProfileAct','MahasiswaController@updateProfileAct');


Route::post('/mhs/tambah/sk','MahasiswaController@sk_kp_mhs_act');


Route::get('/data','MahasiswaController@data');

Route::post('/mhs/tambah/prakp','MahasiswaController@pra_kp_mhs_act');

Route::post('/mhs/tambah/kp','MahasiswaController@kp_mhs_act');



Route::get('dosen/index_dosen','DosenController@index_dosen');




Route::get('/dosen/daftar_bimbingan', function () {
    return view('dosen/data_bimbingan');
});

Route::get('/dosen/jadwal_ujian', function () {
    return view('dosen/jadwal_ujian');
});


//Koordinator
Route::get('/koor/set/ajaran','KoorController@setajaran');
Route::put('/koor/edit/set/ajaran','KoorController@setajaranAct');

Route::get('/koor/index_koor','KoorController@index_koor');
Route::get('/koor/verifikasi_sk','KoorController@verifikasi_sk');
Route::get('/koor/verifikasi_prakp','KoorController@verifikasi_prakp');
Route::get('/koor/verifikasi_kp','KoorController@verifikasi_kp');
Route::get('/koor/penjadwalan_ujian','KoorController@penjadwalan_ujian');

Route::get('/file/sk/all','MahasiswaController@downloadall')->name('downloadfileall');


Route::get('/file/sk/{id}','MahasiswaController@download')->name('downloadfile');

// Route::get('/file/sk/{id}','KoorController@downsk');
// Route::get('get/{filename}', [KoorController::class, 'verifikasi_kp']);


Route::get('/setuju/surat_keterangan/{id}','KoorController@sk_setuju');
Route::put('/setuju/surat_keterangan/act','KoorController@sk_setuju_act');


//VERIFIKASI
Route::get('verifikasi/sk/status/{id}','KoorController@status_sk');
Route::get('verifikasi/prakp/status/{id}','KoorController@status_prakp');
Route::get('verifikasi/kp/status/{id}','KoorController@status_kp');


//PENJADWALAN UJIAN
Route::get('/koor/atur/jadwal/ujian/{id}','KoorController@form_penjadwalan_ujian');

Route::post('/koor/atur/jadwal/ujian/simpan/{id}','KoorController@form_penjadwalan_ujian_act');

Route::get('/koor/lihat/jadwal/{nim}','KoorController@lihat_jadwal_ujian');







//Nantii
Route::get('/koor/registrasi','KoorController@registrasi');
Route::get('/koor/login','KoorController@login');
Route::post('/koor/registrasi/tambah','UserKoorController@store');
Route::get('/koor/signin','KoorController@dashboard');




