<?php

namespace App\Http\Controllers;

use App\Models\Cetakan;
use Dompdf\Dompdf;
use Dompdf\Options;
use App\Models\Murabahah;
use Illuminate\Http\Request;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\DB;
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
        $ambil = Cetakan::all();
        $result = DB::select('SELECT nama,kode FROM cetakan GROUP BY kode,nama');
        $cetakan=[];
        foreach ($result as $key => $value) {
            $cetakan[]=['nama'=>$value->nama,'kode'=>$value->kode,'path'=>[]];
        }
        for ($i=0; $i < count($ambil); $i++) { 
            for ($x=0; $x < count($cetakan); $x++) { 
                if($cetakan[$x]['kode'] == $ambil[$i]['kode']){
                    $cetakan[$x]['path'][]=$ambil[$i]['path'];
                }
            }
        }
        return view('murabahah.index',['title'=>'Murabahah'],compact('data','cetakan'));
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
    public function destroy($id, Cetakan $cetakan)
    {
        DB::delete("DELETE FROM cetakan WHERE kode = '$id'");
        return redirect()->route('mba.index')->with('success','Data berhjasil dihapus');
    }

    public function print_pdf(Request $request, $id){
        $mba = DB::select("SELECT * FROM cetakan WHERE kode='$id'");
        $options = new Options();
        $dompdf = new Dompdf($options);
        $html = view('murabahah.pdf',compact('mba'));
        $dompdf->loadHtml($html);
        //tambahkan baris ini supaya gambar bisa tampil
        $dompdf->set_option('isRemoteEnabled', TRUE);
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();
        $dompdf->stream('pdf',array("Attachment" => false));
    }
}
