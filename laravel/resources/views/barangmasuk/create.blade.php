@extends('layouts.main')
@section('main')
<div class="row">
    <form action="{{ route('barangMasuk.store') }}" method="post" class="bg-light py-4 shadow">
        @csrf
        <div class="col-4">
            <div class="mb-3 d-flex justify-content-between">
                <label for="trx_date" class="col-6">Tanggal</label>
                <input type="date" class="form-control" id="trx_date" name="trx_date">
            </div>
        </div>
        <div class="col-lg-8">
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
                        <td><select name="item_id[]" id="item_id" class="form-select">
                                @foreach ($item as $i)
                                <option value="{{ $i->id }}">{{ $i->name }}</option>
                                @endforeach
                            </select></td>
                        <td><input type="text" class="form-control" name="qty[]"></td>
                        <td class="text-center">
                            <ion-icon name="trash-bin" size="large" class="text-danger kurang"></ion-icon>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class=" col-4">
            <div class="mb-3 float-end">
                <Button type="submit" class="btn btn-primary  rounded-0">Proses</Button>
                <Button type="button" class="btn btn-danger rounded-0">Batal</Button>
            </div>
        </div>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
    integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
        tambah()
        kurang()
    });

    function tambah() {
        html = `<tr>
                    <td><select name="item_id[]" id="item_id" class="form-select">
                                @foreach ($item as $i)
                                <option value="{{ $i->id }}">{{ $i->name }}</option>
                                @endforeach
                            </select></td>
                    <td><input type="text" class="form-control" name="qty[]"></td>
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
