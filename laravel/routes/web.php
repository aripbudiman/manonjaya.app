<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ItemsController;
use App\Http\Controllers\PetugasController;
use App\Http\Controllers\StokItemsController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\BarangMasukController;
use App\Http\Controllers\BarangKeluarController;
use App\Http\Controllers\WakalahInputController;
use App\Http\Controllers\KolektabilitasController;
use App\Http\Controllers\MurabahahController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome',['title'=>'Home']);
});

Route::resource('items',ItemsController::class);
Route::resource('barangMasuk',BarangMasukController::class);
Route::resource('barangKeluar',BarangKeluarController::class);
Route::resource('transaksi',TransaksiController::class);
Route::resource('petugas',PetugasController::class);
Route::resource('stokItems',StokItemsController::class);
Route::resource('wakalahInput',WakalahInputController::class);
Route::resource('kol',KolektabilitasController::class);
Route::resource('mba',MurabahahController::class);
Route::get('export',[KolektabilitasController::class,'export'])->name('export');
Route::post('import',[KolektabilitasController::class,'import'])->name('import');

Route::post('filterPar',[KolektabilitasController::class,'filterPar'])->name('filterPar.post');
// Route::resource('item',ItemsController::class);