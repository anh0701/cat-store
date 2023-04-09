----- TẠO PROJECT
composer create-project laravel/laravel example-app
----- CAU LENH TAO SERVER
cd example-app
php artisan serve

-   controller ở html của app
-   view ở trong resources
-   đăng ký chạy thẳng thì ở trong routes của resources
-   tên file view ten_file.blade.php
-   folder app: + console: tất cả câu lệnh chạy ở môi trường cmd + exceptions: chứa file liên quan đến đường lỗi + http: Controllers, Middleware: bộ lọc request(ví dụ dùng trong phân quyền),Models: chứa tất cả các class models, Providers: khai báo các service (trung tâm khởi tạo ứng dụng)
-   bootstrap: file khởi động khi bd request,
-   config: cấu hình database,...
-   database: hỗ trợ các class + factories: file định nghĩa các cột

*   migrations: file tạo chỉnh sửa dữ liệu (như kiểu lịch sử thay đổi database để có thể backup lại dữ liệu)
    +seeders: file thêm dữ liệu

-   public: index , .htaccess: khi sử dụng apache, confix: setup khi sử dụng trên iis, (có thể có file css,...)
-   resources: view: view ở mô hình MVC
-   routes: web.php: setup router cho web, api: ...api, console:..., channels:...
-   storage: + app: public: file upload

*   framework: views: cache view..., logs: file lưu trữ lỗi ,..

-   vender: file liên quan đến core của lavarel
-   .env: là file cấu hình, thiết lập môi trường
-   .env.example: file mẫu
-   artisan: hỗ trợ câu lệnh cmd
-   phpunit: file cấu hình của unit test
-   server.php:
-   webpack: là công cụ .........liên quan đến frontend

-   index( public) -> app(bootstrap) -> có thể Kernel(Http) -> service provider (app)-> routes -> middleware(app) -> controller

-   php artisan list: trả về list các câu lệnh để tạo server, file,...

*   B1: cấu hình, phân quyền bootstrap cache, storage app public, ....
*   B2: .env: app_key(phải có), app_debug: true(hiển thị lỗi các thứ nếu có),
*   B3: setup thời gian, config -> app -> 'timezone '=> 'Asia/Ho_Chi_Minh'
*   B4: thiết lập môi trường,( khi đang code xây dựng thì home.blame.php: nên để app debug: true, còn nếu mà up lên server thì để false), khi là false thì lỗi ở lavavel(logs - storage); app_env => local: (test), nếu là production: (thật)
*   B5: Thiết lập cơ sở dữ liệu config -> db -> chạy migration: php artisan migrate hoặc là cài trong .env -> chạy migrate
*   B6: bật chế độ bảo trì(hiển thị web đang bảo trì cho người dùng biết): php artisan down, muốn sửa vào view tạo view bảo trì để thay thế mặc định hiển thị lỗi 503 ....

---------------CÂU LỆNH TẠO KEY------------------

-   php artisan key:generate
-   thiết lập timezone: config/app.php: 'timezone' => 'UTC' => 'timezone' => 'Asia/Ho_Chi_Minh'

00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000

1. router

-   định hướng url path
-   khai báo router trong routes/web.php,....

        1. router web (web.php)

        -   phương thức get
            **_Route::get('/', function () {
            return view('welcome');
            });_**
        -   phương thức post
            **_Route::post('/', function () {
            return view('welcome');
            });_**
        -   phương thức put
            **_Route::put('/', function () {
            return view('welcome');
            });_**
        -   phương thức patch
            Route::patch('/', function () {
            return view('welcome');
            });
        -   phương thức delete
            **_Route::delete('/', function () {
            return view('welcome');
            });_**
        -   phương thức options
            **_Route::options('/', function () {
            return view('welcome');
            });_**
        -   với nhiều phương thức được khai báo trong mảng method
            **_Route::match($method, $path, function () {
            return view('welcome');
            });_**
        -   tất cả các phương thức
            **_Route::any('/', function () {
            return view('welcome');
            });_**

        2. direct web php

        -   chuyển hướng trang web: **_Route::redirect('Uri bắt đầu', 'uri đích', mã lỗi nếu có);_**
        -   **_Route::view('URI', 'viewName'); // tương tự phương thức get_**
        -   gộp nhóm(cach go nhanh trong vsc sd extension: route :: group): **_Route::prefix('admin')->group(function () {
            Route::get('/users', function () {
            // Matches The "/admin/users" URL
            });
            });_**
        -   id tu tang (nếu muốn id có thể có hoặc không thì ghi là {id?}) : **_Route::get('home/{id}', function($id){
            $content = "phuong thuc voi tham so: ";
            $content.= 'id = '.$id;
            return $content;
            }); _**
        -   validate duong dan(flag la chuỗi đến dấu - cuối cùng, id là số cuối cùng đường dẫn):
             **_ Route::get('home/{flag}-{id}', function($flag, $id){
                $content = "phuong thuc voi tham so: ";
                $content.= 'id = '.$id.'<br/>';
            $content.= 'flag = '.$flag;
            return $content;
            })->where([
            'flag' => '.+',
            'id' => '[0-9]+'
            ]);_**
        - ***Route::prefix('products')->group(function () {
        Route::get('show-form', function(){
            return view('form');;
        })->name('products.show-form');
        // đặt tên show form của products
        // để trên view dùng hàm: route('name mình vừa tạo') => chuyển hướng sang route đó
        // đường dẫn được chuyển đến sẽ là http://127.0.0.1:8000/products/show-form

    });\*\*\*

    -   middleware: terminal chạy câu lệnh: php artisan make:middleware tên*tự*đặt => 1 file trong middleware (http(app)). trong file đó viết return chuyển hướng trang, xong rồi khai báo class đó vào kernel trong https, trong web.php thì **_Route::middleware($name)->group($callback)_**, (có 1 router đặt name, để chuyển hướng trong file middleware, $name là tên class ở file middleware được khai báo ở kernel)
    -domain: tên miền chính và phụ, khi gõ vào tên miền phụ nó sẽ nhận request callback(liên quan đến khi deploy) ***Route::domain('{subdomain}.unicode.vn')->group($callback)\*\*\*
    -   gọi đến controller:

    *   **_ Route::get('/', 'namespace của controller + action')_**:
        ví dụ: **_Route::get('/', 'App\Http\Controllers\HomeController@index)->name('home');_**
    *   cách 2: **_Route::get('/', [tên_controller :: class, 'tên action' ]);_** (nhớ phải use đường dẫn đến Controller, dùng từ phiên bản 8 trở lên)
        Ví dụ: **_Route::get('/', [HomeController::class, 'getCategories']);_**

-----------.-------------------------

-   bôi đen chữ ấn shift + kí tự cần thêm vào đầu và cuối của đoaạn bôi đen ví dụ: (), {}, '', "",...
