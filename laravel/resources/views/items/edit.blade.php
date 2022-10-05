@extends('layouts.main')
@section('main')
<div class="row">
    <div class="col">
        <form action="{{ route('items.update',$item->id) }}" method="POST" class="col-4">
            @csrf
            @method('PUT')
            <div class="mb-3">
                <label for="name" class="form-label">Nama Items</label>
                <input type="text" value="{{ $item->name }}" class="form-control @error('name') is-invalid @enderror"
                    id="name" name="name">
                @error('name')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
                @enderror
            </div>
            <div class="mb-3">
                <label for="satuan" class="form-label">Satuan</label>
                <select name="satuan" id="satuan" class="form-select @error('satuan') is-invalid                   
                @enderror">
                    <option value="{{ $item->satuan }}">{{$item->satuan}}</option>
                    <option value="unit">unit</option>
                    <option value="pcs">pcs</option>
                    <option value="lembar">lembar</option>
                    <option value="stick">stick</option>
                    <option value="roll">roll</option>
                </select>
                @error('satuan')
                <div class="invalid-feedback">
                    {{ $message }}
                </div>
                @enderror
            </div>
            <div class="mb-3">
                <Button type="submit" class="btn btn-primary">Proses</Button>
            </div>
        </form>
    </div>
</div>

@endsection
