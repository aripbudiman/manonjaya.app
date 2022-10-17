<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ItemsController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\MajelisController;
use App\Http\Controllers\PetugasController;
use App\Http\Controllers\MurabahahController;
use App\Http\Controllers\StokItemsController;
use App\Http\Controllers\TransaksiController;
use App\Http\Controllers\BarangMasukController;
use App\Http\Controllers\BarangKeluarController;
use App\Http\Controllers\WakalahInputController;
use App\Http\Controllers\KolektabilitasController;
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

// Route::get('/', function () {
//     return view('welcome',['title'=>'Home']);
// });
Route::get('/login',[LoginController::class,'login'])->name('login');
Route::get('/',[HomeController::class,'index'])->name('home')->middleware('auth');
Route::post('loginaksi',[LoginController::class,'loginaksi'])->name('loginaksi');
Route::get('home',[HomeController::class,'index'])->name('home')->middleware('auth');
Route::get('logoutaksi',[LoginController::class,'logoutaksi'])->name('logoutaksi')->middleware('auth');

Route::resource('items',ItemsController::class)->middleware('auth');
Route::resource('barangMasuk',BarangMasukController::class)->middleware('auth');
Route::resource('barangKeluar',BarangKeluarController::class)->middleware('auth');
Route::resource('transaksi',TransaksiController::class)->middleware('auth');
Route::resource('petugas',PetugasController::class)->middleware('auth');
Route::resource('stokItems',StokItemsController::class)->middleware('auth');
Route::resource('wakalahInput',WakalahInputController::class)->middleware('auth');
Route::resource('kol',KolektabilitasController::class)->middleware('auth');
Route::resource('mba',MurabahahController::class)->middleware('auth');
Route::get('export',[KolektabilitasController::class,'export'])->name('export')->middleware('auth');
Route::post('import',[KolektabilitasController::class,'import'])->name('import')->middleware('auth');
Route::resource('majelis',MajelisController::class)->middleware('auth');
Route::get('petugas/{id}/status/{status}',[PetugasController::class,'changeStatus'])->name('petugas.changeStatus')->middleware('auth');

Route::get('wakalah/{id}/status/{status}',[WakalahInputController::class,'changeStatus'])->name('wakalah.changeStatus')->middleware('auth');
Route::get('saldo',[WakalahInputController::class,'saldo'])->name('wakalah.saldo')->middleware('auth');
Route::post('filterPar',[KolektabilitasController::class,'filterPar'])->name('filterPar.post')->middleware('auth');
// Route::resource('item',ItemsController::class);