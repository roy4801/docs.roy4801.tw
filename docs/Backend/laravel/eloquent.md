# Eloquent

## Get SQL query

```php
DB::enableQueryLog();

// Eloquent query

dump(DB::getQueryLog();)
```

## Raw

```
DB::statement('query') -> bool

DB::select('query') ->> result
Model::select(DB::raw('query'))->get();

$users = DB::select('select * from users where id = ?', array(1));
$users = DB::select( DB::raw("select * from users where username = :username"), array('username' => Input::get("username")));
```

## Where

```php
Model::where('condition')
->where('condition')  # and
->orWhere('condtion') # or
->get()
```

## Table

```php linenums="1"
DB::table('table');
```

## Transcation

https://dev.to/inspector/resolve-mysql-lock-wait-timeout-dealing-with-laravel-queues-and-jobs-4a6g

```php linenums="1"
DB::transaction(function () {
    DB::table('users')->update(['votes' => 1]);

    DB::table('posts')->delete();
}, 5);
```

- Reappempts

```php linenums="1"
DB::transaction(function () {
	/* ... */
}, 5);
```

### Manually

```php linenums="1"
DB::beginTransaction();

DB::rollBack();

DB::commit();
```
