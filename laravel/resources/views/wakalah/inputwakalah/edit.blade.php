@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col-4">
        <form action="{{ route('wakalahInput.update',$wakalah->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="mb-1">
                <label for="petugas" class="form-label">Nama Anggota</label>
                <select name="petugas" id="petugas" class="form-select">
                    <option value="{{ old('petugas',$wakalah->petugas) }}">{{ old('petugas',$wakalah->petugas) }}
                    </option>
                    @foreach ($petugas as $p)
                    <option value="{{ $p->name }}">{{ $p->name }}</option>
                    @endforeach
                </select>
            </div>
            <div class="mb-1">
                <label for="nama_anggota" class="form-label">Nama Anggota</label>
                <input type="text" id="nama_anggota" class="form-control rounded-0" name="nama_anggota"
                    value="{{ old('nama_anggota',$wakalah->nama_anggota) }}">
            </div>
            <div class="mb-1">
                <label for="majelis" class="form-label">Majelis</label>
                <input type="text" id="majelis" class="form-control rounded-0" name="majelis"
                    value="{{ old('majelis',$wakalah->majelis) }}">
            </div>
            <div class="mb-1">
                <label for="nominal" class="form-label">Nominal</label>
                <input type="text" id="nominal" class="form-control rounded-0" name="nominal"
                    value="{{ old('nominal',$wakalah->nominal) }}">
            </div>
            <div class="mb-1">
                <label for="trx_wkl" class="form-label">Tanggal Wakalah</label>
                <input type="text" id="trx_wkl" class="form-control rounded-0" name="trx_wkl"
                    value="{{ old('nominal',$wakalah->trx_wkl) }}">
            </div>
            <div class="mb-1">
                <button class="btn btn-warning" type="submit">Update</button>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#nominal').autoNumeric('init', {
            aSep: '.',
            aDec: ',',
            mDec: '0'
        });
    });

</script>
@endsection
