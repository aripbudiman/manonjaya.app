@extends('layouts.main')
@section('main')
<div class="row">
    @if (Session::get('success'))
    <div class="alert alert-primary alert-dismissible fade show" role="alert">
        <strong>{{ Session::get('success') }}!</strong> Cek kembali data.
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    @endif
    <div class="mb-3">
        <a href="{{ route('export') }}" class="btn btn-success rounded-0">Export Excel</a>
        <a class="btn btn-warning rounded-0" data-bs-toggle="modal" data-bs-target="#import-modal">
            Import Excel
        </a>
    </div>
    <div class="col-12 mb-3">
        {{-- <form action="{{ route('filterPar.post') }}" method="post">
        <div class="row">
            @csrf
            <div class="mb-2 col-12 col-lg-2">
                <label for="majelis">Majelis</label>
                <select name="majelis" id="majelis" class="form-select">
                    @foreach ($majelis as $item)
                    <option value="{{ $item->majelis }}">{{ $item->majelis }}</option>
                    @endforeach
                </select>
            </div>
            <div class="mb-2 col-12 col-lg-2">
                <label for="tanggal">Tanggal</label>
                <input type="date" name="dari" id="dari" class="form-control">
            </div>
            <div class="mb-2 col-12 col-lg-2">
                <label for="tanggal">Tanggal</label>
                <input type="date" name="sampai" id="sampai" class="form-control">
            </div>
            <div class="mb-2 col-12 col-lg-2 position-relative">
                <button type="submit" class="btn btn-success rounded-0 position-absolute bottom-0">Filter</button>
            </div>
        </div>
        </form> --}}
    </div>
    <div class="col">
        <table class="table table-bordered border-dark">
            <thead>
            </thead>
            <tbody>
            </tbody>
        </table>
    </div>
</div>
{{-- modal import --}}
<!-- Modal -->
<div class="modal fade rounded-0" id="import-modal" tabindex="-1" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog rounded-0">
        <div class="modal-content">
            <form action="{{ route('import') }}" method="POST" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Import Data</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    @csrf
                    <div class="form-group">
                        <input type="file" name="file" id="file" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success rounded-0">Import</button>
                    <button type="button" class="btn btn-secondary rounded-0" data-bs-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
@endsection
