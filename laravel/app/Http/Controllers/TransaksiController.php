<?php

namespace App\Http\Controllers;

use App\Models\Items;
use App\Models\Petugas;
use App\Models\Transaksi;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;

class TransaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $items = Transaksi::with('petugas','items')->paginate();
        // return $items;
        return view('transaksi.index',['title'=>'Transaksi'],compact('items'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $petugas = Petugas::all();
        $items= Items::all();
        return view('transaksi.create',['title'=>'Transaksi baru'],compact('petugas','items'));
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
        $petugas = $request->petugas_id;
        $item = $request->item_id;
        $qty = $request->qty;
        for($i=0;$i<count($item);$i++){
            $data = [
                'trx_date'=>$tgl,
                'petugas_id'=>$petugas,
                'item_id'=>$item[$i],
                'qty'=>$qty[$i]
            ];
            DB::table('transaksi')->insert($data);
        }
        return redirect()->route('transaksi.index')->with('success','Transaksi berhasil dilakukan');
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
    public function destroy(Request $request, Transaksi $transaksi)
    {
        $transaksi->delete();
        return redirect()->route('transaksi.index')->with('delete','Data telah terhapus');
    }
}
