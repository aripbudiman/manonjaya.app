<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cetakan extends Model
{
    use HasFactory;
    protected $table = 'cetakan';
    protected $fillable = [
        'kode','nama','path'
    ];
    public $timestamps = false;
}
