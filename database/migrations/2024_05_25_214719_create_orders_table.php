<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->bigInteger('id')->primary();
            $table->string('phone', 10)->nullable();
            $table->string('address', 225)->nullable();
            $table->string('total', 45)->nullable();
            $table->unsignedBigInteger('users_id')->index('fk_orders_users1_idx');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
