<?php

namespace App\Http\Controllers;

use App\Models\Murabahah;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class MurabahahController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data = Murabahah::all();
        return view('murabahah.index',['title'=>'Murabahah'],compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $tgl = date('d-M-Y');
        $nama = $request->nama;
        $majelis = $request->majelis;
        $tujuan ="public/MBA/".$majelis;
        $namaFoto ='@'.$tgl.'@'.$nama.'@'.$majelis.'@';
        $foto =[];
        $data = $request->file('foto');
        $no=1;
        foreach ($data as $image) {
                $nama = $image->getClientOriginalName();
                $image->move($tujuan,$namaFoto.substr($nama,-6));
                $tj = '/'."MBA/".$majelis.'/'.$namaFoto.substr($nama,-6);
                Murabahah::create([
                    'deskripsi'=>$nama,
                    'tanggal'=>date('Y-m-d'),
                    'path'=>$tj 
                ]);
        }
            return redirect()->route('mba.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
