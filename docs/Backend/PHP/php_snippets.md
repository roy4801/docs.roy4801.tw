# Snippets

## Error

```php
ini_set('display_errors', 1);
error_reporting(E_ALL);
```

```php
$s = proc_get_status($res);
posix_kill($s['pid'], SIGKILL);
proc_close($res);
```