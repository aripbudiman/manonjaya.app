<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Murabahah extends Model
{
    use HasFactory;
    protected $table = 'murabahah';


    protected $fillable = [
        'deskripsi','tanggal','path'
    ];

    public $timestamps = false;
}
