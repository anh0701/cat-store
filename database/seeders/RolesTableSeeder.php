<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $roles = [
            [
              
                'name' => 'QTV'
            ],
            [
        
                'name' => 'KH'
            ]
        ];

        DB::table('roles')->insert($roles);
    }
}
