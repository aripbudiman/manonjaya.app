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
        $data = DB::select('SELECT tanggal, nama, majelis, par,tunggakan_hari AS hari FROM kolektabilitas ORDER BY nama, tanggal DESC');
        $report = [];

        foreach ($data as $key => $value) {
            $report[]=[$value->nama,$value->majelis];
        }
        return $report;
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
