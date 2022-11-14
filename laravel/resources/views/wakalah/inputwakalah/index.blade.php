@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col-12 col-lg-12 mb-3">
        <Button class="btn btn-primary rounded-0" id="btn-add"><i class="far fa-file-word"></i> Add</Button>
        {{-- <Button class="btn btn-danger rounded-0 d-none" id="btn-back"><i class="fas fa-backward"></i> Back</Button> --}}
    </div>
    <div class="col-12 col-lg-9 mb-3 d-none" id="form-tambah-wakalah">
        <form action="{{ route('wakalahInput.store') }}" method="POST">
            @csrf
            <div class="row">
                <div class="col-12">
                    <div class="mb-3 col-4 float-end d-flex">
                        <label for="trx_wkl" class="d-inline-block p-3 fw-bold">Tanggal</label>
                        <input type="date" name="trx_wkl" id="trx_wkl" class="form-control rounded-0">
                    </div>
                </div>
                <div class="col-12">
                    <table class="table table-bordered">
                        <thead>
                            <tr class="text-center table-light">
                                <th scope="col">No</th>
                                <th scope="col">Petugas</th>
                                <th scope="col">Nama Anggota</th>
                                <th scope="col">Majelis</th>
                                <th scope="col">Nominal</th>
                                <th><i class="far fa-trash-alt"></i></th>
                            </tr>
                        </thead>
                        <tbody id="list-row">
                            <tr>
                                <th scope="row" class="text-center">1</th>
                                <td><select name="petugas[]" id="petugas" class="form-select rounded-0">
                                        @foreach ($petugas as $item)
                                        <option value="{{ $item->name }}">{{ $item->name }}</option>
                                        @endforeach
                                    </select></td>
                                <td><input type="text" class="form-control rounded-0" name="nama_anggota[]"
                                        id="nama_anggota"></td>
                                <td><select name="majelis[]" id="majelis" class="form-select rounded-0">
                                        @foreach ($majelis as $item)
                                        <option value="{{ $item->nama }}">{{ $item->nama }}</option>
                                        @endforeach
                                    </select></td>
                                <td><input type="text" class="form-control rounded-0 nominal" id="nominal"
                                        name="nominal[]">
                                </td>
                                <td class="text-center align-middle"><button class="hapus rounded-0 btn-danger"><i
                                            class="far fa-trash-alt"></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-12 text-center">
                    <button type="submit" class="btn btn-primary rounded-0">Proses</button>
                    <button id="btn-back" class="btn btn-warning rounded-0">Cancel</button>
                    <button class="btn btn-success rounded-0" id="btn-add-row">Add Row</button>
                </div>
            </div>
        </form>

    </div>
    <div class="col-12" id="tabel-wakalah">
        <table class="table table-bordered" id="Barang">
            <thead>
                <tr class="text-center">
                    <th scope="col">No</th>
                    <th scope="col">Petugas</th>
                    <th scope="col">Nama Anggota</th>
                    <th scope="col">Nama Majelis</th>
                    <th scope="col">Nominal</th>
                    <th scope="col">Tanggal Wakalah</th>
                    <th scope="col">Tanggal Murabahah</th>
                    <th scope="col">Status</th>
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                @php
                $no=1;
                @endphp
                @foreach ($wakalah as $item)
                <tr>
                    <th scope="row" class="text-center">{{ $no++ }}</th>
                    <td>{{ $item->petugas }}</td>
                    <td>{{ $item->nama_anggota }}</td>
                    <td>{{ $item->majelis }}</td>
                    <td>{{ Str::rp($item->nominal) }}</td>
                    <td>{{ $item->trx_wkl }}</td>
                    <td>{{ $item->trx_mba }}</td>
                    <td
                        class="fw-bold text-center <?= ($item->status == 'OnProses') ? 'text-primary': (($item->status =='Approve') ? 'text-success' : 'text-danger') ?>">
                        {{ $item->status }}
                    </td>
                    <td class="text-center d-flex justify-content-center">
                        <a href="{{ route('wakalah.changeStatus',['id'=>$item->id,'status'=>'Approve']) }}"
                            class="btn border-0 btn-success rounded-0"><i class="fas fa-check-circle"></i></a>
                        <a href="{{ route('wakalah.changeStatus',['id'=>$item->id,'status'=>'Reject']) }}"
                            class="btn border-0 btn-danger rounded-0"><i class="fas fa-times-circle"></i></a>
                        <a href="{{ route('wakalahInput.edit',$item->id) }}"
                            class="btn border-0 btn-warning rounded-0"><i class="fas fa-edit"></i></a>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
<script>
    $(document).ready(function () {
        rp()
        add()
        back()
        addRow()
        hapus()
    });


    function addRow() {
        let input = `<tr>
                                <th scope="row" class="text-center">1</th>
                                <td><select name="petugas[]" id="petugas" class="form-select rounded-0">
                                        @foreach ($petugas as $item)
                                        <option value="{{ $item->name }}">{{ $item->name }}</option>
                                        @endforeach
                                    </select></td>
                                <td><input type="text" class="form-control rounded-0" name="nama_anggota[]"
                                        id="nama_anggota"></td>
                                <td><select name="majelis[]" id="majelis" class="form-select rounded-0">
                                        @foreach ($majelis as $item)
                                        <option value="{{ $item->nama }}">{{ $item->nama }}</option>
                                        @endforeach
                                    </select></td>
                                <td><input type="text" class="form-control rounded-0 nominal" id="nominal"
                                        name="nominal[]">
                                </td>
                                <td class="text-center align-middle"><button class="hapus rounded-0 btn-danger"><i
                                            class="far fa-trash-alt"></i></button>
                                </td>
                            </tr>`;
        $('#btn-add-row').click(function (e) {
            e.preventDefault();
            $('#list-row').append(input);
            rp()
        });
    }

    function hapus() {
        $(document).on('click', '.hapus', function (e) {
            e.preventDefault()
            $(this).parents('tr').remove()
        })
    }

    function add() {
        $('#btn-add').click(function (e) {
            e.preventDefault();
            $('#form-tambah-wakalah').removeClass('d-none');
            $('#btn-add').addClass('d-none');
            $('#btn-back').removeClass('d-none');
            $('#tabel-wakalah').addClass('d-none');
        });
    }

    function back() {
        $('#btn-back').click(function (e) {
            e.preventDefault();
            $('#form-tambah-wakalah').addClass('d-none');
            $('#btn-back').addClass('d-none');
            $('#btn-add').removeClass('d-none');
            $('#tabel-wakalah').removeClass('d-none');
        });
    }

    function rp() {
        $('.nominal').autoNumeric('init', {
            aSep: '.',
            aDec: ',',
            mDec: '0'
        });
    }

</script>
@endsection
