# laravel Controller

## Invokable

- Make Controller

```bash
php artisan make:controller -i NAME
```

- Route
```php linenums="1"
Route::get('YOUR/ROUTE', TestInvokable::class);
Route::get('YOUR/ROUTE', '\App\Http\Controllers\TestInvokable');
```


