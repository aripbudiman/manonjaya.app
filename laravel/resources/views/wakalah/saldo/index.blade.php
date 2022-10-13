@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col">
        <table class="table table-bordered table-light">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Nama</th>
                    <th scope="col">Saldo Wakalah</th>
                </tr>
            </thead>
            <tbody>
                @php
                $no=1;
                $saldoAkhir =0;
                @endphp
                @foreach ($saldo as $data)
                <tr>
                    <th scope="row">{{ $no++ }}</th>
                    <td>{{ $data->petugas }}</td>
                    <td>{{ Str::rp($data->saldo) }}</td>
                </tr>
                @php
                $saldoAkhir +=$data->saldo;
                @endphp
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                    <th colspan="2">Total Saldo Wakalah</th>
                    <td>{{ Str::rp($saldoAkhir) }}</td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
@endsection
