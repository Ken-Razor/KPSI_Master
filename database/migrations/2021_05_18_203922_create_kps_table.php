<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateKpsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('kp', function (Blueprint $table) {
            $table->string('id_mhs');
            $table->string('semester')->nullable();
            $table->string('tahun')->nullable();
            $table->string('nim')->nullable();
            $table->string('nik')->nullable();
            $table->string('judul')->nullable();
            $table->string('tools')->nullable();
            $table->string('spesifikasi')->nullable();
            $table->string('penguji')->nullable();
            $table->string('ruang')->nullable();
            $table->string('lembaga');
            $table->string('pimpinan');
            $table->string('no_telp')->nullable();
            $table->string('alamat');
            $table->string('dokumen');
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
        Schema::dropIfExists('kp');
    }
}
