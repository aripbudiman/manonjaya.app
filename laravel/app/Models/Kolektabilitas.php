<?php

namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Kolektabilitas extends Model
{
    use HasFactory;
    protected $table = 'kolektabilitas';


    protected $fillable = [
        'tanggal','no_rekening','petugas','majelis','nama','pokok','margin',
        'jangka_waktu','angsuran_pokok','angsuran_margin','terbayar','seharusnya',
        'saldo_pokok','saldo_margin','tunggakan_angsuran','tunggakan_hari','tunggakan_pokok',
        'tunggakan_margin','par','cpp_persentase','cpp_nominal'
    ];

    public $timestamps = false;


    public function historyKolektabilitas(){
        $tgl = DB::table('list_tgl')
        ->select('*')
        ->orderBy('tanggal','desc')
        ->get();
        $tanggal=[];
        foreach($tgl as $tgl){
            $tanggal[]=$tgl->tanggal;
        }

        $report = DB::table('kolektabilitas')
        ->select('tanggal','majelis','nama','angsuran_pokok','terbayar','seharusnya','tunggakan_hari','par','no_rekening')
        ->where('majelis','tmj candi muara jambi')
        // ->whereBetween('tunggakan_hari',[1,1000])
        // ->whereBetween('tanggal',['2022-09-01','2022-09-30'])
        ->orderBy('nama')
        ->orderBy('tanggal','desc')
        ->get();

        $majelis = DB::table('kolektabilitas')
        ->select('nama','no_rekening')
        ->where('majelis','tmj candi muara jambi')
        // ->whereBetween('tunggakan_hari',[1,1000])
        // ->whereBetween('tanggal',['2022-09-01','2022-09-30'])
        ->groupBy('nama','no_rekening')
        ->orderBy('nama')
        ->orderBy('tanggal','desc')
        ->get();

        $result = [];
        foreach ($majelis as $key => $m) {
            for ($i=0; $i < count($tanggal); $i++) {
                for ($x=0; $x < count($report); $x++) { 
                    if($tanggal[$i] != $report[$x]->tanggal){
                        $result[]=["nama"=>$m->nama,"no_rekening"=>$m->no_rekening,"tanggal"=>$tanggal[$i],"par"=>"null"];
                        
                    }
                    $result[]=["nama"=>$m->nama,"no_rekening"=>$m->no_rekening,"tanggal"=>$tanggal[$i],"par"=>$report[$x]->par];
                }
            }
        }
        $data =[];
        foreach($majelis as $m){
            $data[]=['nama'=>$m->nama,'no_rekening'=>$m->no_rekening,'riwayat'=>[]];
        }
        for ($i=0; $i < count($data); $i++) { 
            for ($x=0; $x < count($tanggal); $x++) { 
                $data[$i]['riwayat'][]=['tanggal'=>$tanggal[$x]];
            }
        }
        
        
        // for ($x=0; $x <count($majelis) ; $x++) { 
        //     for ($i=0; $i < count($report); $i++) {
                
        //         if($data[$x]["no_rekening"] == $report[$i]->no_rekening){
        //             $data[$x]["riwayat"][]=["tanggal"=>$report[$i]->tanggal,"par"=>$report[$i]->par,"tgk_hari"=>$report[$i]->tunggakan_hari];
        //         }
        //     }
        // }


        return $result;
        // return $report[0]->tanggal;

    }

    public function filterPar($majelis,$dari,$sampai){

        $report = DB::table('kolektabilitas')
        ->select('tanggal','majelis','nama','angsuran_pokok','terbayar','seharusnya','tunggakan_hari','par','no_rekening')
        ->where('majelis',$majelis)
        ->whereBetween('tunggakan_hari',[1,1000])
        ->whereBetween('tanggal',[$dari,$sampai])
        ->orderBy('nama')
        ->orderBy('tanggal','desc')
        ->get();

        $majelis = DB::table('kolektabilitas')
        ->select('nama','no_rekening')
        ->where('majelis',$majelis)
        ->whereBetween('tunggakan_hari',[1,1000])
        ->whereBetween('tanggal',[$dari,$sampai])
        ->groupBy('nama','no_rekening')
        ->orderBy('nama')
        ->orderBy('tanggal','desc')
        ->get();

        $data = [];
        foreach ($majelis as $key => $m) {
            $data[]=["nama"=>$m->nama,"no_rekening"=>$m->no_rekening,"riwayat"=>[]];
        }

        for ($x=0; $x <count($majelis) ; $x++) { 
            for ($i=0; $i < count($report); $i++) { 
                if($data[$x]["no_rekening"] == $report[$i]->no_rekening){
                    $data[$x]["riwayat"][]=["tanggal"=>$report[$i]->tanggal,"par"=>$report[$i]->par,"tgk_hari"=>$report[$i]->tunggakan_hari];
                }
            }
        }
        return $data;
    }
}
