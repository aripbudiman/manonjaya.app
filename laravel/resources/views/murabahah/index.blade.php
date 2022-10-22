@extends('layouts.main')
@section('main')
<style>
    .pilih-foto {
        padding: 13px;
        border: 1px solid black;
    }

</style>
<div class="row">
    @if (Session::get('success'))
    <div class="alert alert-success" role="alert">
        {{ Session::get('success') }}
    </div>
    @endif
    <div class="col-12">
        <nav class="navbar navbar-expand-lg bg-warning">
            <div class="container-fluid">
                <div class="collapse navbar-collapse d-flex justify-content-between" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="#" id="btn-dokumentasi">Dokumentasi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="#" id="btn-form">Form Murabahah</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" aria-current="page" href="#" id="btn-print-mba">Print MBA</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link btn btn-danger text-white rounded-0 py-1" aria-current="page" href="#"
                                id="btn-buat-print">Buat
                                Print</a>
                        </li>
                        <li class="nav-item d-none">
                            <button type="button" class="btn btn-secondary rounded-0 py-1" data-bs-toggle="modal"
                                data-bs-target="#staticBackdrop">
                                tes modal
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div class="col-12 col-lg-5 d-none" id="form-mba">
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
<div class="row bg-light shadow-lg justify-content-center" id="dokumentasi">
    @foreach ($data as $item)
    <div class="col-lg-3 col-12 p-2" style="box-sizing: border-box">
        <img src="{{ asset($item->path) }}" class="img-thumbnail" alt="{{ $item->deskripsi }}">
        <a href="{{ route('print_pdf',['id'=>$item->id]) }}" target="_blank" class="btn btn-warning btn-sm rounded-0"><i
                class="fas fa-print"></i>
            Print</a>
        <input class="form-check-input rounded-0 pilih-foto" type="checkbox" value="{{ $item->path }}"
            id="flexCheckDefault">
    </div>
    @endforeach
</div>
<div class="d-none" id="print-mba">
    <table class="table">
        <thead>
            <tr>
                <th scope="col">No</th>
                <th scope="col">Nama</th>
                <th scope="col">Kode</th>
                <th scope="col">Image</th>
                <th scope="col">Aksi</th>
            </tr>
        </thead>
        <tbody>
            @php
            $no=1;
            @endphp
            @foreach ($cetakan as $data)
            <tr>
                <th scope="row">{{ $no++ }}</th>
                <td>{{ $data['nama'] }}</td>
                <td>{{ $data['kode'] }}</td>
                <td>
                    @for ($i = 0; $i < count($data['path']); $i++) <img src="{{ asset($data['path'][$i]) }}" width="50">
                        @endfor
                </td>
                <td>

                    <a href="{{ route('print_pdf',['id'=>$data['kode']]) }}" target="_blank" class="text-white"><button
                            class="btn-sm btn-success rounded-circle"><i class="fas fa-print"></i></button></a>

                    <form action="{{ route('mba.destroy',$data['kode']) }}" method="POST" class="d-inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="btn-sm btn-danger rounded-circle"><i
                                class="fas fa-trash-alt"></i></button>
                    </form>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal fade" id="modal-pengajuan-cetakan" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="{{ route('cetakan.store') }}" method="POST">
                @csrf
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Buat Cetakan MBA</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-2">
                        <label for="kode" class="form-label">kode</label>
                        <input type="text" class="form-control rounded-0" id="kode-unik" name="kode" readonly>
                    </div>
                    <div class="mb-2">
                        <label for="nama" class="form-label">Nama</label>
                        <input type="text" class="form-control rounded-0" id="nama-tpl" name="nama" placeholder="nama">
                    </div>
                    <div class="mb-2" id="list-foto-modal">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">SAVE</button>
                    <button type="button" class="btn btn-secondary" id="btn-close">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        tambahList()
        navbar()
        buatprint()
        closeModal()
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

    function navbar() {
        $('#btn-dokumentasi').click(function (e) {
            e.preventDefault();
            $('#form-mba').addClass('d-none');
            $('#dokumentasi').removeClass('d-none');
            $('#print-mba').addClass('d-none');
        });
        $('#btn-form').click(function (e) {
            e.preventDefault();
            $('#form-mba').removeClass('d-none');
            $('#dokumentasi').addClass('d-none');
            $('#print-mba').addClass('d-none');
            $('#btn-form').addClass('active');
        });
        $('#btn-print-mba').click(function (e) {
            e.preventDefault();
            $('#form-mba').addClass('d-none');
            $('#dokumentasi').addClass('d-none');
            $('#print-mba').removeClass('d-none');
        });
    }

    function buatprint() {
        $('#btn-buat-print').click(function (e) {
            e.preventDefault();
            let tag = document.getElementsByTagName("input");
            let data = [];
            for (var i = 0; i < tag.length; i++) {
                if (tag[i].checked) {
                    data.push(tag[i].value)
                    $('#list-foto-modal').append(`
                    <img src="${tag[i].value}" width="100">
                    <input type="hidden" class="form-control rounded-0" id="path" name="path[]" value="${tag[i].value}" >
                    `)
                }
            }
            const kode = Math.random().toString(36).substring(2, 8);
            $('#kode-unik').val(kode)
            $('#modal-pengajuan-cetakan').modal('show')
        });
    }

    function closeModal() {
        $('#btn-close').click(function (e) {
            e.preventDefault();
            location.reload()
        });
    }

</script>
@endsection
