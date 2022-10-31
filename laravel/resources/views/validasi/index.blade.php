@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col">
        <button class="btn btn-success rounded-0" id="btn-modal-import">Import</button>
    </div>
    <div class="col-12">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Nama Majelis</th>
                    <th scope="col">Tanggal</th>
                    <th scope="col">Aksi</th>
                </tr>
            </thead>
            <tbody>
                @php
                $no=1;
                @endphp
                @foreach ($data as $d)
                <tr>
                    <td>{{ $no++ }}</td>
                    <td>{{ $d->majelis }}</td>
                    <td>{{ $d->tgl }}</td>
                    <td><a href="{{ route('show',['majelis'=>$d->majelis,'tgl'=>$d->tgl]) }}">Show</a></td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>

{{-- modal import --}}
<div class="modal fade" id="modal-import" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
    aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="{{ route('push_excel') }}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="staticBackdropLabel">Import File Excel</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="input-group">
                        <input type="file" class="form-control rounded-0" id="file" name="file">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success">Import</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Cancel</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    $(document).ready(function () {
        $('#btn-modal-import').click(function (e) {
            e.preventDefault();
            $('#modal-import').modal('show')
        });
    });

</script>
@endsection
