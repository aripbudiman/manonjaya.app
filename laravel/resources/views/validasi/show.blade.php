@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col-6">
        <form action="{{ route('proses_validasi') }}" method="POST">
            @csrf
            <table class="table table-bordered">
                <thead class="m-0 p-0">
                    <tr class="text-center align-middle table-primary">
                        <th scope="col">No</th>
                        <th scope="col">ID</th>
                        <th scope="col">NAMA</th>
                        <th scope="col">SALDO SISTEM</th>
                        <th scope="col">SALDO BUKU</th>
                        <th scope="col">KETERANGAN</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                    $no=1;
                    @endphp
                    @foreach ($data as $d)
                    <tr class="p-0 m-0">
                        <th class="py-0 text-center">{{ $no++ }}<input type="text" name="id[]" class="border-0"
                                style="width: 40px" value="{{ $d->id }}" readonly hidden>
                        </th>
                        <td class="py-0"><input type="text" class="border-0" name="id_anggota[]"
                                value="{{ $d->id_anggota }}" readonly></td>
                        <td class="py-0"><input type="text" class="border-0" name="nama_anggota[]"
                                value="{{ $d->nama_anggota }}" readonly>
                        </td>
                        <td class="py-0"><input type="text" name="saldo_sistem[]" class="border-0 w-auto"
                                value="{{ number_format($d->saldo_sistem,0,',','.') }}" readonly>
                        <td class="py-0"><input type="text" name="saldo_buku[]" class="border-0 nominal w-auto"
                                value="{{ $d->saldo_buku }}">
                        </td>
                        <td class="py-0"><input type="text" name="keterangan[]" class="border-0">
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
            <div class="text-center">
                <Button type="submit" class="btn btn-success rounded-0">Proses</Button>
                <a href="{{ route('validasi') }}" class="btn btn-danger rounded-0">Batal</a>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        rp()
    });

    function rp() {
        $('.nominal').autoNumeric('init', {
            aSep: '.',
            aDec: ',',
            mDec: '0'
        });
    }

</script>
@endsection
