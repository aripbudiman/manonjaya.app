@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col-6">
        <table class="table table-bordered" id="Barang">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Items</th>
                    <th scope="col">Stok</th>
                    <th scope="col">Satuan</th>
                </tr>
            </thead>
            <tbody>
                @php
                $no=1;
                @endphp
                @foreach ($stok as $item)
                <tr>
                    <th>{{ $no++ }}</th>
                    <td>{{ $item['nama'] }}</td>
                    <td>{{ $item['stok']['barang_masuk'] - $item['stok']['transaksi'] }}</td>
                    <td></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

@endsection
