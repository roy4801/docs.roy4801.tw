# Schedule

## Start the scheduler

Add the following command as a cron job 

```
* * * * * cd /path-to-your-project && php artisan schedule:run >> /dev/null 2>&1
```

## Define a schedule

* In `App\Console\Kernel.php`

```
protected function schedule(Schedule $schedule)
{
	// Closures
    $schedule->call(function () {
        DB::table('recent_users')->delete();
    })->daily();

    // invokable objects
    $schedule->call(new DeleteRecentUsers)->daily();

    $schedule
        -> command('cbh:dummyCommand')
        -> everyFiveMinutes()
        -> appendOutputTo ('/my/logs/laravel_output.log');
}
```

### Schedule a artisan command

```php linenums="1"
// string
$schedule->command('command:exec')->everyMinute();

// class
$schedule->command(CommandClass::class, ['--option', $option])->daily();
```

### Schedule a queue jobs

```php linenums="1"
$schedule->job(new QueueJob, args, ...)->daily();
```

### Schedule a shell command

```php linenums="1"
$schedule->exec('shell command')->daily();
```

## Frequency options

- `->cron('* * * * *')` Cron

- Minute
    - `->everyXMinute[s]()`
        - Every X minutes $X \in {1,2,3,4,5,10,15,30}$
        - e.g. `->everyMinute()`, `->everyFiveMinutes()`

-Hour
    - `->hourly()`
        - every hour
    - `->hourlyAt(X)`
        - Every hour at X minutes
    - `->everyXHours()`
        - Every X hours $X \in {2, 3, 4, 6}$

- Day
    - `->daily()`
        - Daily at midnight
    - `->dailyAt('AA:BB')`
        - Daily at AA:BB
    - `->twiceDaily(1, 13);`
        - Daily at 1:00 & 13:00

- Week
    - `->weekly()`
        - Every Sunday at 0:00
    - `->weeklyOn(1, '8:00')`
        - Every X day at Time

- Month
    - `->monthly()`
        - Eveny first day (0:00) of the month
    - `->monthlyOn(4, '15:00')`
        - Every 4th day of the month (15:00)
    - `->twiceMonthly(1, 16, '13:00')`
        - Every month on the 1st and 16th at 13:00
    - `->lastDayOfMonth('15:00');`
        - The last day of the month at 15:00

- Year
    - `->yearly();`
    - `->yearlyOn(6, 1, '17:00');`

- Other
    - `->timezone('Asia/Taipei')` Timezone

<https://laravel.com/docs/8.x/scheduling#day-constraints>
