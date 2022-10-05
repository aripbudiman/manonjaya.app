@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col-4">
        <form action="{{ route('petugas.store') }}" method="POST">
            @csrf
            <div class="mb-3">
                <label for="name" class="form-label">Nama Petugas</label>
                <input type="text" class="form-control rounded-0" id="name" name="name">
            </div>
            <div class="mb-3">
                <label for="role" class="form-label">Role</label>
                <select name="role" id="role" class="form-select rounded-0">
                    <option value="tpl">tpl</option>
                    <option value="admin">admin</option>
                    <option value="supervisi">supervisi</option>
                    <option value="kepala cabang">kepala cabang</option>
                </select>
            </div>
            <input type="hidden" name="status" value="aktif">
            <button type="submit" class="btn btn-dark rounded-0">Submit</button>
        </form>
    </div>
</div>
@endsection
