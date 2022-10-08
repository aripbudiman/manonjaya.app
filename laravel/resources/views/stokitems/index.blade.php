@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col-6">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Nama Barang / Items</th>
                    <th scope="col">Satuan</th>
                    <th scope="col">Stok</th>
                    <th scope="col">Status</th>
                </tr>
            </thead>
            <tbody>
                @php
                $no=1;
                @endphp
                @foreach ($stok as $item)
                <tr>
                    <th scope="row">{{ $no++ }}</th>
                    <td>{{ $item->name }}</td>
                    <td>{{ $item->satuan }}</td>
                    <td>{{ $item->stok }}</td>
                    <td><?= ($item->stok <= 20)? '<span class="badge rounded-pill text-bg-danger">Stok Sedikit lagi</span>' : '<span class="badge rounded-pill text-bg-success">Cukup</span>' ?>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

@endsection
