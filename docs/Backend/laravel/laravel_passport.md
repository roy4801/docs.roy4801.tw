# Laravel Passport

## Installation

```bash
# Install laravel/passport
composer require laravel/passport
# Migrate oauth tables
php artisan migrate
# Generate keys
php artisan passport:install
```

## Configuration

* Add `Laravel\Passport\HasApiTokens` to User model

```php 
<?php
 
namespace App;
 
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
 
class User extends Authenticatable
{
    use HasApiTokens, Notifiable;
}
```

* Add `Passport::routes()` to `AuthServiceProvider::boot()`

```php linenums="1"
class AuthServiceProvider extends ServiceProvider
	public function boot()
    {
        $this->registerPolicies();
 
        Passport::routes();
    }
```

* Register `Laravel\Passport\PassportServiceProvider` to `config/app.php`

```php linenums="1"
'providers' => [
	// ...

    /*
	 * Package Service Providers...
	 */
    Laravel\Passport\PassportServiceProvider::class,

    // ...
],
```

* Change `driver` of api to `passport` in `config/auth.php`

```php linenums="1"
'guards' => [
    'web' => [
        'driver' => 'session',
        'provider' => 'users',
    ],
 
    'api' => [
        'driver' => 'passport',
        'provider' => 'users',
    ],
],
```

* Deploy Laravel/Passport

```php linenums="1"
php artisan passport:keys
```

### Create Auth Controller

```php linenums="1"
<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\User;

class PassportAuthController extends Controller
{
    /**
     * Registration
     */
    public function register(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|min:4',
            'email' => 'required|email',
            'password' => 'required|min:8',
        ]);
 
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password)
        ]);
       
        $token = $user->createToken('LaravelAuthApp')->accessToken;
 
        return response()->json(['token' => $token], 200);
    }
 
    /**
     * Login
     */
    public function login(Request $request)
    {
        $data = [
            'email' => $request->email,
            'password' => $request->password
        ];
 
        if (auth()->attempt($data)) {
            $token = auth()->user()->createToken('LaravelAuthApp')->accessToken;
            return response()->json(['token' => $token], 200);
        } else {
            return response()->json(['error' => 'Unauthorised'], 401);
        }
    }   
}
```

## Reference

Laravel 8 REST API with Passport Authentication Tutorial
<https://www.positronx.io/laravel-rest-api-with-passport-authentication-tutorial/>

