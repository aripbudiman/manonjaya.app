@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col">
        <table class="table table-bordered" id="Barang">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Nama Majelis</th>
                    <th scope="col">Nama Anggota</th>
                    <th scope="col">Nominal</th>
                    <th scope="col">Tanggal Wakalah</th>
                    <th scope="col">Tanggal Murabahah</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
@endsection
