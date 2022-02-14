# sqlite3

<https://docs.python.org/3/library/sqlite3.html>

- Connect to a db

```python3 linenum="1"
import sqlite3
con = sqlite3.connect('example.db') # :memory: for in memory db
# Doing things
con.close()
```

- Create a cursor object and CRUD

```python3 linenums="1"
cur = con.cursor()

# Create
cur.execute('CREATE TABLE status (state)')
con.commit()
```

- Request with parameters
	- Prevent from SQL injection

```python3 linenums="1"
# ? style
cur.execute("insert into lang values (?, ?)", ("C", 1972))

lang_list = [
    ("Fortran", 1957),
    ("Python", 1991),
    ("Go", 2009),
]
cur.executemany("insert into lang values (?, ?)", lang_list)

# named style
cur.execute("select * from lang where first_appeared=:year", {"year": 1972})
```

## Read

- Iterator

```python3 linenums="1"
for row in cur.execute('SELECT * FROM stocks ORDER BY price'):
    print(row)
```

- Use `fetchone()`, `fetchmany()`, `fetchall()`

```python3 linenums="1"
cur.execute('SELECT * FROM table WHERE a=b')
cur.fetchone() # None if no data available
```

### Row

```linenums="1"
>>> con.row_factory = sqlite3.Row
>>> cur = con.cursor()
>>> cur.execute('select * from stocks')
<sqlite3.Cursor object at 0x7f4e7dd8fa80>

>>> r = cur.fetchone()
>>> type(r)
<class 'sqlite3.Row'>

>>> tuple(r)
('2006-01-05', 'BUY', 'RHAT', 100.0, 35.14)

>>> len(r)
5

>>> r[2]
'RHAT'

>>> r.keys()
['date', 'trans', 'symbol', 'qty', 'price']

>>> r['qty']
100.0

>>> for member in r:
...     print(member)
...
2006-01-05
BUY
RHAT
100.0
35.14
```

## Other

- Execute whole script

```python3 linenums="1"
cur.executescript('''
	create table person(
        firstname,
        lastname,
        age
    );

    create table book(
        title,
        author,
        published
    );

    insert into book(title, author, published)
    values (
        'Dirk Gently''s Holistic Detective Agency',
        'Douglas Adams',
        1987
    );
''')
```

> TODO: advanced usage
