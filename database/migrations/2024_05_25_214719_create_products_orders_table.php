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
        Schema::create('products_orders', function (Blueprint $table) {
            $table->bigInteger('products_id')->index('fk_product_order_products1_idx');
            $table->bigInteger('orders_id')->index('fk_product_order_orders1_idx');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products_orders');
    }
};
