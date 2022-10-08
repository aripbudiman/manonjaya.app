<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TriggerTambahstok extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared('CREATE TRIGGER `TambahStok` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN UPDATE items SET stok=stok+new.qty WHERE items.id=new.item_id; END');
        DB::unprepared('CREATE TRIGGER `DeleteBarangMasuk` AFTER DELETE ON `barang_masuk` FOR EACH ROW BEGIN UPDATE items SET stok=stok-old.qty WHERE items.id=old.item_id; END');
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
