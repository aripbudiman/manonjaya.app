@extends('layouts.main')
@section('main')
<form action="{{ route('transaksi.store') }}" method="POST" class="col-10">
    <div class="row bg-light shadow px-3 py-4">
        @csrf
        <div class="col-1">
            <label for="tanggal" class="fw-bold">Tanggal</label>
        </div>
        <div class="col-3">
            <input type="date" id="tanggal" name="trx_date" class="form-control rounded-0">
        </div>
        <div class="col-1">
            <label for="petugas_id" class="fw-bold">Petugas</label>
        </div>
        <div class="col-3">
            <select name="petugas_id" id="petugas_id" class="form-select rounded-0">
                <option value=""></option>
                @foreach ($petugas as $p)
                <option value="{{ $p->id }}">{{ $p->name }}</option>
                @endforeach
            </select>
        </div>
        <div class="col-12 mt-3">
            <table class="table table-light table-sm table-bordered table-stripped">
                <thead>
                    <tr class="text-center">
                        <th scope="col">Nama Item</th>
                        <th scope="col" width="100">Qty</th>
                        <th scope="col" width="80">
                            <ion-icon name="add-circle" size="large" class="text-success tambah"></ion-icon>
                    </tr>
                </thead>
                <tbody id="form-tambah-barang-masuk">
                    <tr class="tr">
                        <td><select name="item_id[]" id="item_id" class="form-select rounded-0">
                                <option value=""></option>
                                @foreach ($items as $i)
                                <option value="{{ $i->id }}">{{ $i->name }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control rounded-0" name="qty[]"></td>
                        <td class="text-center">
                            <ion-icon name="trash-bin" size="large" class="text-danger kurang"></ion-icon>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class=" col-6">
            <div class="mb-3 float-end">
                <Button type="submit" class="btn btn-primary  rounded-0">Proses</Button>
                <a href="{{ route('transaksi.index') }}" class="btn btn-danger rounded-0">Batal</a>
            </div>
        </div>
    </div>
</form>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
    integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        tambah()
        kurang()
    });

    function tambah() {
        html = `<tr>
                    <td><select name="item_id[]" id="item_id" class="form-select rounded-0">
                        <option value=""></option>
                                @foreach ($items as $i)
                                <option value="{{ $i->id }}">{{ $i->name }}</option>
                                @endforeach
                            </select></td>
                    <td><input type="text" class="form-control rounded-0" name="qty[]"></td>
                    <td class="text-center">
                        <ion-icon name="trash-bin" size="large" class="kurang text-danger"></ion-icon>
                    </td>
                    </tr>`
        $('.tambah').click(function (e) {
            e.preventDefault();
            $('#form-tambah-barang-masuk').append(html)
        });

    }

    function kurang() {
        $(document).on("click", ".kurang", function () {
            $(this).parents('tr').remove()
        })
    }

</script>
@endsection
