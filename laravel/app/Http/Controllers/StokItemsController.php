<?php

namespace App\Http\Controllers;

use BarangMasuk;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;

class StokItemsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $barangMasuk = DB::select('SELECT item_id,SUM(qty) as bm_qty FROM barang_masuk GROUP BY item_id ORDER BY item_id ASC;');
        $transaksi = DB::select('SELECT item_id,SUM(qty) as t_qty FROM transaksi GROUP BY item_id ORDER BY item_id ASC;');
        // $stok =[];
        // $items =DB::select('SELECT * FROM items');

        // for ($i=0; $i < count($items); $i++) { 
        //     $stok[]=['nama'=>$items[$i]->name,'satuan'=>$items[$i]->satuan,'stok'=>[]];
        // }
        // for ($i=0; $i < count($items); $i++) { 
        //     for ($x=0; $x < count($barangMasuk); $x++) { 
        //         if($items[$i]->id == $barangMasuk[$x]->item_id){
        //             $stok[$i]['stok'][]=['bm'=>$barangMasuk[$x]->bm_qty];
        //         }else{
        //             $stok[]['stok'][]=['bm'=>0];
        //         }
                
        //     }
        // }



        return $barangMasuk;
        // return view('stokitems.index',['title'=>'Stok Items(ATK)'],compact('stok'));
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
