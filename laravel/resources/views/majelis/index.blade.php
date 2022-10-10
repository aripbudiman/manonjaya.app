@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col-12">
        @if (Session::get('success'))
        <div class="alert alert-primary" role="alert">
            {{ Session::get('success') }}
        </div>
        @endif
    </div>
    <div class="col-7">
        <form action="{{ route('majelis.store') }}" method="POST">
            @csrf
            <div class="mb-3 d-flex">
                <input type="text" id="nama" name="nama" class="form-control rounded-0" placeholder="Nama Masjelis..">
                <button type="submit" class="btn btn-primary rounded-0">Submit</button>
            </div>
        </form>
    </div>
    <div class="col-12">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Nama Majelis</th>
                </tr>
            </thead>
            <tbody>
                @php
                $no=1;
                @endphp
                @foreach ($majelis as $data)
                <tr>
                    <th scope="row">{{ $no++ }}</th>
                    <td>{{ $data->nama }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
@endsection
