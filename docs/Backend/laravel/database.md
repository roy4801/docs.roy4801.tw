# Database

* Config: `config/database.php`



## Migration

- Create a migraiton
	- The table to migrate: `--table=XXX`
	- The table to be created: `--create=XXX`

```bash
php artisan make:migration create_user_table
```

- Execute the migration
```bash
php artisan migrate
php artisan migrate --path=path_to_php
```

### Ref

<https://stackoverflow.com/questions/30447385/artisan-creating-tables-in-database>
