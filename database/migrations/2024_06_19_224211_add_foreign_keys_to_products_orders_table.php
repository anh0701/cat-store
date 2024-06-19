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
        Schema::table('products_orders', function (Blueprint $table) {
            $table->foreign(['orders_id'], 'fk_product_order_orders1')->references(['id'])->on('orders')->onUpdate('no action')->onDelete('no action');
            $table->foreign(['products_id'], 'fk_product_order_products1')->references(['id'])->on('products')->onUpdate('no action')->onDelete('no action');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('products_orders', function (Blueprint $table) {
            $table->dropForeign('fk_product_order_orders1');
            $table->dropForeign('fk_product_order_products1');
        });
    }
};
