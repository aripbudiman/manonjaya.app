<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Kolektabilitas extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kolektabilitas', function (Blueprint $table) {
            $table->id();
            $table->date('tanggal');
            $table->string('no_rekening');
            $table->string('petugas');
            $table->string('majelis');
            $table->string('nama');
            $table->decimal('pokok', 15, 0)->nullable();
            $table->decimal('margin', 15, 0)->nullable();
            $table->integer('jangka_waktu')->nullable();
            $table->decimal('angsuran_pokok',15,0)->nullable();
            $table->decimal('angsuran_margin',15,0)->nullable();
            $table->integer('terbayar')->nullable();
            $table->integer('seharusnya')->nullable();
            $table->decimal('saldo_pokok',15,0)->nullable();
            $table->decimal('saldo_margin',15,0)->nullable();
            $table->integer('tunggakan_angsuran')->nullable();
            $table->integer('tunggakan_hari')->nullable();
            $table->decimal('tunggakan_pokok',15,0)->nullable();
            $table->decimal('tunggakan_margin',15,0)->nullable();
            $table->string('par')->nullable();
            $table->integer('cpp_persentase');
            $table->decimal('cpp_nominal',15,0)->nullable();
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

//             $table->string('margin');
//             $table->integer('jangka_waktu');
//             $table->string('angsuran_pokok');
//             $table->string('angsuran_margin');
//             $table->integer('terbayar');
//             $table->integer('seharusnya');
//             $table->string('saldo_pokok');
//             $table->string('saldo_margin');
//             $table->integer('tunggakan_angsuran');
//             $table->integer('tunggakan_hari');
//             $table->string('tunggakan_pokok');
//             $table->string('tunggakan_margin');
//             $table->string('par');
//             $table->string('cpp_persentase');
//             $table->string('cpp_nominal');