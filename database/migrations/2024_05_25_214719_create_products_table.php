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
        Schema::create('products', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->string('name', 45);
            $table->bigInteger('price');
            $table->tinyInteger('status');
            $table->string('description')->nullable();
            $table->bigInteger('categories_id')->index('fk_products_categories1_idx');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
