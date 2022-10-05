<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BarangMasuk extends Model
{
    use HasFactory;
    protected $table = 'barang_masuk';
    // protected $primaryKey = 'id';


    protected $fillable = [
        'item_id','qty','trx_date'
    ];

    public $timestamps = true;

    public function items()
    {
        return $this->hasOne(Items::class,'id','item_id');
    }
}
