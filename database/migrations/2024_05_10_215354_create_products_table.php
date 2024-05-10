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
            $table->float('price');
            $table->string('image', 45)->nullable();
            $table->decimal('vote', 5, 0)->nullable();
            $table->string('type', 45)->nullable()->default('"1kg", "500g", "1.5kg", "2kg", "2.5kg", "3kg"');
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
