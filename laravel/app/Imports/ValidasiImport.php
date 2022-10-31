<?php

namespace App\Imports;

use App\Models\ValidasiTabungan;
use Maatwebsite\Excel\Concerns\ToModel;

class ValidasiImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new ValidasiTabungan([
            'id_anggota' => $row[0], 
            'nama_anggota' => $row[1], 
            'majelis' => $row[2],
            'petugas' => $row[3],
            'saldo_sistem' => $row[4],
        ]);
    }
}
