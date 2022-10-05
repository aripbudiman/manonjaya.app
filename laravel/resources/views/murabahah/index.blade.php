@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col-12 col-lg-5">
        <form action="{{ route('mba.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="mb-3">
                <label for="nama" class="form-label">Nama Anggota</label>
                <input type="text" class="form-control rounded-0" id="nama" name="nama">
            </div>
            <div class="mb-3">
                <label for="majelis" class="form-label">Majelis</label>
                <input type="text" class="form-control rounded-0" id="majelis" name="majelis">
            </div>
            <div class="mb-2">
                <button type="button" class="btn btn-success rounded-0" id="tambah-foto"><i class="fas fa-plus"></i>
                    Tambah upload</button>
            </div>
            <div class="list-upload">
                <div class="mb-3 list-item">
                    <label for="foto1" class="form-label">Foto</label>
                    <input type="file" class="form-control rounded-0" id="foto" name="foto[]">
                </div>
            </div>
            <div class="mb-3 float-end">
                <button type="submit" class="btn btn-warning rounded-0"><i class="fas fa-upload"></i> Upload</button>
                <button type="reset" class="btn btn-danger rounded-0">Batal</button>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        tambahList()
    });



    function tambahList() {
        let InputFoto = `<div class="mb-3 list-item">
                    <label for="foto2" class="form-label">Foto</label>
                    <input type="file" class="form-control rounded-0" id="foto" name="foto[]">
                </div>`
        $('#tambah-foto').click(function (e) {
            e.preventDefault();
            $('.list-upload').append(InputFoto);
        });
    }

</script>
@endsection
