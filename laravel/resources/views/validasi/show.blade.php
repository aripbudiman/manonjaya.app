@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col">
        <table class="table">
            <thead class="m-0 p-0">
                <tr class="p-0 m-0">
                    <th scope="col">No</th>
                    <th scope="col">ID</th>
                    <th scope="col">NAMA</th>
                    <th scope="col">SALDO SISTEM</th>
                    <th scope="col">SALDO BUKU</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($data as $d)
                <tr class="p-0 m-0">
                    <th class="py-0"><input type="text" style="width: 40px"></th>
                    <td class="py-0"><input type="text" value="{{ $d->id_anggota }}"></td>
                    <td class="py-0"><input type="text" value="{{ $d->nama_anggota }}"></td>
                    <td class="py-0"><input type="text" value="{{ number_format($d->saldo_sistem,0,',','.') }}">
                    <td class="py-0"><input type="text">
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection
