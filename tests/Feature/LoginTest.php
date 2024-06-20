<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use App\Models\Role;

class LoginTest extends TestCase
{
    /**
     * A basic feature test example.
     */
    use RefreshDatabase;

    /** @test */
    public function login_pass(): void
    {

         // Tạo role giả
         $role = Role::factory()->create();

         // Tạo một user giả
        $user = User::factory()->create([
            'email' => 'tranthib@example.com',
            'password' => Hash::make('password123'),
            'role_id' => $role->id, 
        ]);

        // Gửi yêu cầu đăng nhập
        $response = $this->postJson('/api/login', [
            'email' => 'tranthib@example.com',
            'password' => 'password123',
        ]);

        // Kiểm tra phản hồi
        $response->assertStatus(200);
        $response->assertJsonStructure(['token']);

    }

     /** @test */
    public function login_fail(){

         // Tạo role giả
         $role = Role::factory()->create();

         // Tạo một user giả
         $user = User::factory()->create([
            'email' => 'tranthib@example.com',
            'password' => Hash::make('password123'),
            'role_id' => $role->id, 
        ]);

        // Gửi yêu cầu đăng nhập với thông tin không hợp lệ
        $response = $this->postJson('/api/login', [
            'email' => 'tranthib@example.com',
            'password' => 'wrongpassword',
        ]);

        // Kiểm tra phản hồi
        $response->assertStatus(400);
        $response->assertJson([
            'success' => false,
            'message' => 'Invalid Credentials',
        ]);
    }
}
