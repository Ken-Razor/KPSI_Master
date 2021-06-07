<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSkKpsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sk_kp', function (Blueprint $table) {
            $table->increments('id');
            $table->string('id_mhs')->nullable();
            $table->string('semester')->nullable();
            $table->string('tahun')->nullable();
            $table->string('nim')->nullable();
            $table->string('lembaga');
            $table->string('pimpinan');
            $table->string('no_telp')->nullable();
            $table->string('alamat');
            $table->string('fax');
            $table->string('dokumen');
            $table->integer('status')->default(3);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sk_kp');
    }
}
