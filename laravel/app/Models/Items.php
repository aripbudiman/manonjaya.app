<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Items extends Model
{
    use HasFactory;
    protected $table = 'items';
    // protected $primaryKey = 'id';


    protected $fillable = [
        'name','satuan','stok'
    ];

    public $timestamps = false;

}
