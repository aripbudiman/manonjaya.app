<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ValidasiTabungan extends Model
{
    use HasFactory;
    protected $table = 'validasi';
    public $timestamps = false;
    protected $fillable = [
    'id_anggota','nama_anggota','majelis','petugas','saldo_sistem','saldo_buku',
        'tgl_posting','tgl_validasi','keterangan'
    ];
}
