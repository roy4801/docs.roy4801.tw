# yaml - python

## Load

```python3
import yaml
with open('a.yml', 'r') as f:
	data = yaml.load(f, Loader=yaml.CLoader)
```

* Load all
	* multiple yamls in the same file splitted by `---`

```python3
for data in yaml.load_all(documents):
	print(data)
```

## Dump

```python3
import yaml
with open('a.yml', 'w') as f:
	f.write(yaml.dump(f, Dumper=yaml.CDumper))
```

## References

PyYAML Documentation</br>
<https://pyyaml.org/wiki/PyYAMLDocumentation>
