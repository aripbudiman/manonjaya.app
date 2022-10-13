<?php

namespace App\Http\Controllers;

use App\Exports\ParExport;
use App\Imports\ParImport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use App\Models\Kolektabilitas;
use Illuminate\Support\Facades\DB;

class KolektabilitasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $par = new Kolektabilitas();
        $data = $par->historyKolektabilitas();
        $pribadi = DB::select('SELECT nama, no_rekening FROM kolektabilitas GROUP BY no_rekening,nama');


        return $pribadi;
        return view('par.index',['title'=>'Portfolio At Risk']);
    }


    public function filterPar(Request $request){
        $par =new Kolektabilitas;    
        $majelis = $request->majelis;
        $dari = $request->dari;
        $sampai = $request->sampai;
        $data = $par->filterPar($majelis,$dari,$sampai);

        $majelis =DB::table('kolektabilitas')
        ->select('majelis')
        ->groupBy('majelis')
        ->get();

        return view('par.index',['title'=>'Portfolio At Risk'],compact('data','majelis'));
        
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

    public function export(){
        return Excel::download(new ParExport,'par.xlsx');
    }


    public function import(Request $request){
        $file = $request->file('file');
        $namaFile = $file->getClientOriginalName();
        $file->move('public/PAR',$namaFile);

        Excel::import(new ParImport,public_path('../../public/PAR/'.$namaFile));
        return redirect()->route('kol.index')->with('success','Data berhasil di import');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
