# Command

## Create a new command

```bash
php artisan make:command CommandName
```

This will generates a `CommandName.php` at `app/Console/Commands/`

```php linenums="1"
<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class DumpQueue extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'command';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        return 0;
    }
}
```

## API

!!!warning
	The description of the command need to insert spaces before and after the colon. e.g. `{arg : description}'`

### Arguments

- Define
```php linenums="1"
protected $signature = 'test:command {arg1 : All jobs}';
```

- Access
```php linenums="1"
$this->argument("arg1"); // arg1

$this->arguements();     // A list of arguments
```

### Options

- Define

```php linenums="1"
protected $signature = 'test:command {--opt1: A option} {--opt2=} {--opt3=123}';
```

- Access

```php linenums="1"
$this->option('opt1'); // flag
$this->option('opt2'); // value if given
$this->option('opt3'); // default value if not specified

$this->options();      // A list of options
```

### Advanced arguements or options

```php
protected $signature = 'test:command {--Q|queue} ';

// Input array
protected $signature = 'test:command {input=*}';     // for Arguemtns

protected $signature = 'email:send {user} {--id=*}'; // for Options
```

### Output

- Write outputs with level
```
$this->line()
$this->info()
$this->comment()
$this->question()
$this->error()
```

