# Testing

- Feature
	- A larger portion of the code, how several objects
- Unit
	- Small functionalities (e.g. a function)

## Config

- Config: `phpunit.xml`
	- Need to `config:cache` after editing

## Usage

- Create

```bash
// Create a feature test
php artisan make:test XXXTest

// Create a unit test
php artisan make:test XXXTest --unit
```

A test would looks like:

```php linenums="1"
<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

use Tests\TestCase // better

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testBasicTest()
    {
        $this->assertTrue(true);
    }
}
```

- Run the test

```bash
php artisan test [--group name] [/path/to/test.php]
```

!!!danger
	`A facade root has not been set` when use things related to the application
	
	```php
	<?php

	namespace Tests\Unit;
	
	use Tests\TestCase;

	class XXXTest extends TestCase
	{

	}
	```

!!!danger
	The test function name must be `testXXX()` or you need to add comment `@test` above the function
	```php
	/** @test */
	public function it_tests_something()
	{
	  ...
	}
	```

