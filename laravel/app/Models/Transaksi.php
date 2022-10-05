<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaksi extends Model
{
    use HasFactory;
    protected $table = 'transaksi';
    // protected $primaryKey = 'id';


    protected $fillable = [
        'item_id','qty','trx_date','petugas_id'
    ];

    public $timestamps = true;

    public function items()
    {
        return $this->hasOne(Items::class,'id','item_id');
    }

    public function petugas()
    {
        return $this->hasOne(Petugas::class,'id','petugas_id');
    }
}
