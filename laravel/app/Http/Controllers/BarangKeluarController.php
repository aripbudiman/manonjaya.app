<?php

namespace App\Http\Controllers;

use App\Models\Items;
use App\Models\BarangKeluar;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;

class BarangKeluarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $items = BarangKeluar::with('items')->paginate(10);
        return view('barangkeluar.index',[
            'title'=>'Barang Keluar'
        ], compact('items'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $items = Items::all();
        return view('barangKeluar.create',['title'=>'Tambah Barang Keluar'],compact('items'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $tgl = $request->trx_date;
        $name= $request->item_id;
        $qty = $request->qty;
        for($i=0;$i<count($name);$i++){
            $data = [
                'item_id'=>$name[$i],
                'qty'=>$qty[$i],
                'trx_date'=>$tgl
            ];
            DB::table('barang_keluar')->insert($data);
        }
        return redirect()->route('barangKeluar.index')->with('success','Data berhasil ditambahkan');
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
    public function destroy(BarangKeluar $barangKeluar)
    {
        $barangKeluar->delete();
        return redirect()->route('barangKeluar.index')->with('delete','Data telah terhapus');
    }
}
