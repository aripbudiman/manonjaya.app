<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ValidasiTabungan extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('validasi', function (Blueprint $table) {
            $table->id();
            $table->string('id_anggota');
            $table->string('nama_anggota');
            $table->string('majelis');
            $table->string('petugas');
            $table->decimal('saldo_sistem',15,0);
            $table->decimal('saldo_buku',15,0)->nullable();
            $table->date('tgl_posting')->default(date('Y-m-d'));
            $table->date('tgl_validasi')->nullable();
            $table->text('keterangan')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
