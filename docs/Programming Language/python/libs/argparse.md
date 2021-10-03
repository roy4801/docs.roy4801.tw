# argparse

* Parse arguments

```python linenums="1"
import argparse
parser = argparse.ArgumentParser(description="xxx")
args = parser.parse_args()
```

* Positional Arguments

```python linenums="1"
parser.add_argument("echo", help="echo the string you use here",
	type=int,          # type
	choices=[0, 1, 2]  # Limit the choices
)
args.echo # variable
```

* Optional Arguments

```python linenums="1"
parser.add_argument("-v", "--verbose", action="count", default=0, help="increase output verbosity")
# action="store_true" => bool
# 
# action="count" => Enable counting the flag e.g. -vv => 2
# 	parser.add_argument("-v", "--verbosity", action="count")

if args.verbosity:
    print("verbosity turned on")
```

* Mutually exclusive

```python linenums="1"
group = parser.add_mutually_exclusive_group()
group.add_argument("-v", "--verbose", action="store_true")
group.add_argument("-q", "--quiet", action="store_true")
```

## Sub-commands

* Create a subparser

```python linenums="1"
subparsers = parser.add_subparsers(title='subcommands', description='valid subcommands',
	help='sub-command help')
# For sub-command `a`
parser_a = subparsers.add_parser('a', help='a help')
parser_a.add_argument('bar', type=int, help='bar help')
# For sub-command `b`
parser_b = subparsers.add_parser('b', help='b help')
parser_b.add_argument('--baz', choices='XYZ', help='baz help')

>>> parser.parse_args(['--help'])
usage: [-h] {a,b} ...

optional arguments:
  -h, --help  show this help message and exit

subcommands:
  valid subcommands

  {a,b}       sub-command help
    a         a help
    b         b help
```

## References

<https://docs.python.org/3/library/argparse.html>
