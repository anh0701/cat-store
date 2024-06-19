<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //
        $users = [
            [
                'email' => 'nguyenvana@example.com',
                'password' => Hash::make('password123'),
                'role_id' => '1'
            ],
            [
                
                'email' => 'tranthib@example.com',
                'password' => Hash::make('password123'),
                'role_id' => '2'
            ],
            [
                
                'email' => 'levanc@example.com',
                'password' => Hash::make('password123'),
                'role_id' => '1'
            ],
        
        ];
        DB::table('users')->insert($users);
    }
}
