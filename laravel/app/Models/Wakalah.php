<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Wakalah extends Model
{
    use HasFactory;

    protected $table = 'wakalah';
    protected $fillable = [
        'petugas','nama_anggota', 'majelis', 'nominal', 'status', 'trx_wkl','trx_mba','created_at','updated_at'
    ];

    public $timestamps = true;
}
