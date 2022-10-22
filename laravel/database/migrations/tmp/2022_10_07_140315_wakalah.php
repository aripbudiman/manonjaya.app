<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Wakalah extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('wakalah', function (Blueprint $table) {
            $table->id();
            $table->string('petugas');
            $table->string('nama_anggota');
            $table->string('majelis');
            $table->decimal('nominal',15,0);
            $table->enum('status',['OnProses','Approve','Reject'])->default('OnProses');
            $table->date('trx_wkl');
            $table->date('trx_mba')->nullable();
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrent();
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
