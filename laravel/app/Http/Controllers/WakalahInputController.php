<?php

namespace App\Http\Controllers;

use App\Models\Kolektabilitas;
use App\Models\Petugas;
use App\Models\Wakalah;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;


class WakalahInputController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $petugas = Petugas::all();
        $majelis = DB::select('SELECT nama FROM majelis');
        $wakalah = Wakalah::all();

        return view('wakalah.inputwakalah.index',['title'=>'Input Wakalah'],compact('petugas','majelis','wakalah'));
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
        $tgl = $request->trx_wkl;
        $petugas = $request->petugas;
        $namaAnggota = $request->nama_anggota;
        $majelis = $request->majelis;
        $nominal = $request->nominal;
        for($i=0;$i<count($majelis);$i++){
            $data = [
                'petugas'=>$petugas[$i],
                'nama_anggota'=>$namaAnggota[$i],
                'majelis'=>$majelis[$i],
                'nominal'=>str_replace('.','',$nominal[$i]),
                'trx_wkl'=>$tgl
            ];
            DB::table('wakalah')->insert($data);
        }
        return redirect()->route('wakalahInput.index')->with('success','Data berhasil ditambahkan');
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


    public function changeStatus(Request $request, $id,$status){
        $wakalah = Wakalah::findOrFail($id);
        $wakalah->status=$status;
        $wakalah->trx_mba=date('Y-m-d');
        $wakalah->save();

        return redirect()->route('wakalahInput.index');
    }
}
