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
        $petugas = DB::select("SELECT * FROM petugas WHERE role='tpl'");
        $majelis = DB::select('SELECT nama FROM majelis');
        $wakalah = DB::select("SELECT * FROM wakalah WHERE status != 'Approve'");

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
        $wakalah=wakalah::findOrFail($id);
        $petugas=Petugas::all();
        return view('wakalah.inputwakalah.edit',['title'=>'Edit Wakalah'],compact('wakalah','petugas'));
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
        $wakalah = wakalah::findOrFail($id);
        $wakalah->petugas =$request->petugas;
        $wakalah->nama_anggota=$request->nama_anggota;
        $wakalah->majelis=$request->majelis;
        $wakalah->nominal=str_replace('.','',$request->nominal);
        $wakalah->trx_wkl=$request->trx_wkl;
        $wakalah->save();
        return redirect()->route('wakalahInput.index');
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

    public function saldo(){
        $saldo = DB::select("SELECT SUM(nominal) AS saldo, petugas FROM wakalah WHERE status='OnProses' group by petugas");

        return view('wakalah.saldo.index',['title'=>'Saldo Wakalah'],compact('saldo'));
    }
}
