<?php

namespace App\Imports;

use App\Models\Kolektabilitas;
use Maatwebsite\Excel\Concerns\ToModel;

class ParImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Kolektabilitas([
            'tanggal'=>$row[1],
            'no_rekening'=>$row[2],
            'petugas'=>$row[3],
            'majelis'=>$row[4],
            'nama'=>$row[5],
            'pokok'=>$row[6],
            'margin'=>$row[7],
            'jangka_waktu'=>$row[8],
            'angsuran_pokok'=>$row[9],
            'angsuran_margin'=>$row[10],
            'terbayar'=>$row[11],
            'seharusnya'=>$row[12],
            'saldo_pokok'=>$row[13],
            'saldo_margin'=>$row[14],
            'tunggakan_angsuran'=>$row[15],
            'tunggakan_hari'=>$row[16],
            'tunggakan_pokok'=>$row[17],
            'tunggakan_margin'=>$row[18],
            'par'=>$row[19],
            'cpp_persentase'=>$row[20],
            'cpp_nominal'=>$row[21]
        ]);
    }
}
// 'no_rekening'=>$row[2],
//             'petugas'=>$row[3],
//             'majelis'=>$row[4],
//             'nama'=>$row[5],
//             'pokok'=>$row[6],
//             'margin'=>$row[7],
//             'jangka_waktu'=>$row[8],
//             'angsuran_pokok'=>$row[9],
//             'angsuran_margin'=>$row[10],
//             'terbayar'=>$row[11],
//             'seharusnya'=>$row[12],
//             'saldo_pokok'=>$row[13],
//             'saldo_margin'=>$row[14],
//             'tunggakan_angsuran'=>$row[15],
//             'tunggakan_hari'=>$row[16],
//             'tunggakan_pokok'=>$row[17],
//             'tunggakan_margin'=>$row[18],
//             'par'=>$row[19],
//             'cpp_persentase'=>$row[20],
//             'cpp_nominal'=>$row[21]