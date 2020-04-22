# click

a python library for parsing arguments

```python
import click

@click.command()
@click.option('--count', default=1, help='Number of greetings.')
@click.option('--name', prompt='Your name',
              help='The person to greet.')
def hello(count, name):
    """Simple program that greets NAME for a total of COUNT times."""
    for x in range(count):
        click.echo('Hello %s!' % name)

if __name__ == '__main__':
    hello()
```

* print help

```python
def print_help_msg(command):
with click.Context(command) as ctx:
    click.echo(command.get_help(ctx))
```

## Reference

click docs 7.x
<https://click.palletsprojects.com/en/7.x/>

Python 用 Click 模組製作好用的指令
<https://myapollo.com.tw/zh-tw/python-click/>
