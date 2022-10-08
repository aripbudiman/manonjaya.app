<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class TriggerTransaksi extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::unprepared('CREATE TRIGGER `TriggerTransaksi` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN UPDATE items SET stok=stok-new.qty WHERE items.id=new.item_id; END');
        DB::unprepared('CREATE TRIGGER `DeleteTransaksi` AFTER DELETE ON `transaksi` FOR EACH ROW BEGIN UPDATE items SET stok=stok+old.qty WHERE items.id=old.item_id; END');
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
