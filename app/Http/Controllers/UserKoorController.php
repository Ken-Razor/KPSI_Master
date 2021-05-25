<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Koordinator;

class UserKoorController extends Controller
{
    public function store(Request $request)
    {
    	if($request->password !== $request->cpassword){
    		\Session::flash('error', 'Password tidak sama !');
    		return redirect('/koor/registrasi');
    	}

    	$data = [
    		'nama' => $request->nama,
    		'email' => $request->email,
    		'password' => \Hash::make($request->password)
    	];

    	Koordinator::create($data);
    	return redirect('/koor/login')->with('sukses-tambah','Registrasi Berhasil');;
    }

    public function login(Request $request)
    {
    	$koordinator = Koordinator::where('email', $request->email)->first();

    		if($koordinator == null){
    			\Session::flash('error', 'Email  tidak ditemukan');
    			return redirect('/koor/login');
    		}
    	
    		if(\Hash::check($request->password, $koordinator->password)){
    			\Session::put('koordinator', $koordinator); //Key Session

    			return redirect('/koor/signin');
    		}else{
    			\Session::flash('error', 'Email atau Password tidak cocok');
    			return redirect('/koor/login');
    		}
    }

    

}
