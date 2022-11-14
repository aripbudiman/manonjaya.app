<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Imports\ValidasiImport;
use App\Models\ValidasiTabungan;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class ValidasiController extends Controller
{
    public function index(){
        $data = DB::select("SELECT majelis,tgl_posting as tgl FROM  validasi GROUP BY majelis,tgl_posting ASC");
        return view('validasi.index',['title'=>'Validasi Tabungan'],compact('data'));
    }

    public function import_excel(Request $request){
        $file = $request->file('file');
        $namaFile = $file->getClientOriginalName();
        $file->move('public/ValidasiTabungan',$namaFile);
        Excel::import(new ValidasiImport,public_path('../../public/ValidasiTabungan/'.$namaFile));
        return redirect()->route('validasi')->with('success','Data berhasil di import');
    }

    public function show($majelis,$tgl){
        $data = DB::select("SELECT * FROM validasi WHERE tgl_posting='$tgl' AND majelis='$majelis'");

        return view('validasi.show',['title'=>'Rekap Validasi Tabungan'],compact('data'));
    }

    public function store(Request $request){
        $id=$request->id;
        $id_anggota=$request->id_anggota;
        $nama=$request->nama_anggota;
        $saldo_sistem=$request->saldo_sistem;
        $saldo_buku = $request->saldo_buku;
        $keterangan = $request->keterangan;
        DB::beginTransaction();
        try{
            for ($i=0; $i < count($id); $i++) { 
                $validasi =ValidasiTabungan::find($id[$i]);
                $validasi->saldo_buku=str_replace('.','',$saldo_buku[$i]);
                $validasi->keterangan=$keterangan[$i];
                $validasi->save();
            }
            DB::commit();
        }catch(\Trowable $th){
            DB::rollBack();
        }
    }

    public function reset(){
        DB::delete('DELETE FROM validasi');
        return back();
    }
}
