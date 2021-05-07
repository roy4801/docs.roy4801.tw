# Schedule

## Start the scheduler

Add the following command as a cron job 

```
* * * * * cd /path-to-your-project && php artisan schedule:run >> /dev/null 2>&1
```

## Define a schedule

* In `App\Console\Kernel`

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

