@extends('layouts/main')

@section('main')
<div class="container">
    <div class="row">
        <div class="col-8">
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

            <a href="{{ route('items.create') }}" class="btn btn-primary mb-3">Tambah</a>
            <table class="table table-bordered">
                <thead>
                    <tr class="table-dark">
                        <th scope="col" width=70 class="text-center">No</th>
                        <th scope="col" class="text-center">Nama Items</th>
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
                        <td>{{ $item->name }}</td>
                        <td>{{ $item->satuan }}</td>
                        <td class="text-center">
                            <a href="{{ route('items.edit',$item->id) }}" class="btn btn-warning">Edit</a>
                            <form action="{{ route('items.destroy',$item->id) }}" method="post" class="d-inline">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
