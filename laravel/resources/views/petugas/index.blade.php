@extends('layouts.main')
@section('main')
<div class="row">
    @if (Session::get('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>{{ Session::get('success') }}!</strong> Cek kembali data.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    @endif
    <div class="mb-3">
        <a class="btn btn-dark rounded-0" href="{{ route('petugas.create') }}">Tambah</a>
    </div>
    @foreach ($items as $item)
    <div class="col-4">
        <div class="card text-bg-light" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title text-center">{{ $item->name }}</h5>
                <h6 class="card-subtitle mb-2 text-muted text-center">{{ $item->role }}</h6>
                <div class="text-center">
                    <img src="{{ url('') }}/public/default.png" width="200">
                </div>
                <div class="text-center">
                    <a href="{{ route('petugas.changeStatus',['id'=>$item->id,'status'=>'aktif']) }}"
                        class="card-link btn btn-warning btn-sm">Aktif</a>
                    <a href="{{ route('petugas.changeStatus',['id'=>$item->id,'status'=>'non aktif']) }}"
                        class="card-link btn btn-sm btn-danger">Non Aktif</a>
                </div>
                <div class="mt-3 text-center">
                    <span
                        class="badge rounded-pill text-bg-{{$item->status=='aktif' ? 'primary' : 'danger'}}">{{ $item->status }}</span>
                </div>
            </div>
        </div>
    </div>
    @endforeach

</div>
@endsection
