<?php

namespace App\Exports;

use App\Models\Kolektabilitas;
use Maatwebsite\Excel\Concerns\FromCollection;

class ParExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Kolektabilitas::all();
    }
}
