# Variable Argument List

## printf-like

```c
void my_printf(const char *fmt, ...)
{
	va_list list;

	va_start(list, fmt);
	vprintf_functions(fmt, list);
	va_end(list);
}
```

## gcc warning

Type-checked against a format string. Enable by `-Wformat`

```
format (archetype, string-index, first-to-check)
```

* Types: `printf`, `scanf`, `strftime` or `strfmon`. `ms_printf`, `ms_strftime` in mingw. `gnu_xxx` for glibc

```c
extern int
my_printf (void *my_object, const char *my_format, ...)
      __attribute__ ((format (printf, 2, 3)));
```

> member function in C++ have the `this` argument. So the index must be counted from 2.

<https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#Common-Function-Attributes>

