@extends('layouts.main')
@section('main')
<div class="row">
    {{-- alert --}}
    @if (Session::get('success'))
    <div class="alert alert-primary alert-dismissible fade show" role="alert">
        <strong>{{ Session::get('success') }}!</strong> Cek kembali data.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    @endif
    @if (Session::get('delete'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <strong>{{ Session::get('delete') }}!</strong> Cek kembali data.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    @endif
    {{-- end alert --}}
    <div class="col">
        <a href="{{ route('barangKeluar.create') }}" class="btn btn-primary mb-3 rounded-0">Tambah</a>
        <table id="Barang" class="table table-striped" style="width:100%">
            <thead>
                <tr>
                    <th scope="col" width="70" class="text-center">No</th>
                    <th scope="col" class="text-center">Tanggal</th>
                    <th scope="col" class="text-center">Nama Item</th>
                    <th scope="col" class="text-center">Qty</th>
                    <th scope="col" class="text-center">Satuan</th>
                    <th scope="col" class="text-center">Action</th>
                </tr>
            </thead>
            <tbody>
                @php
                $no=1;
                @endphp
                @foreach ($items as $item)
                <tr>
                    <th scope="row" class="text-center">{{ $no++ }}</th>
                    <td>{{ $item->trx_date }}</td>
                    <td>{{ $item->items->name }}</td>
                    <td>{{ $item->qty }}</td>
                    <td>{{ $item->items->satuan }}</td>
                    <td>
                        <form action="{{ route('barangKeluar.destroy',$item->id) }}" method="POST">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn-sm btn-danger rounded-0">Delete</button>
                        </form>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection
