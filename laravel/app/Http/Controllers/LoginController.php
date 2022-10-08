<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    public function login(){
        if(Auth::check()){
            return redirect('home',['title'=>'home']);
        }
        else
        {
            return view('login',['title'=>'login']);
        }
    }

    public function loginaksi(Request $request){
        $data = [
            'name'=> $request->input('email'),
            'password'=> $request->input('password'),
        ];

        if(Auth::attempt($data)){
            return redirect('/');
        }else{
            Session()->flash('error', 'Username atau Password salah');
            return redirect('/login');
        }
        
    }

    public function logoutaksi(){
        Auth::logout();
        return redirect('/login');
    }
}
