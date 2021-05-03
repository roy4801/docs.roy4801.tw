# snippets

## string format malloc

```c linenums="1"
#define ssprintf(...) \
    ({                \
        int _ss_size = snprintf(0, 0, ##__VA_ARGS__);           \
        char *_ss_ret = (char*)malloc(_ss_size * sizeof(char)); \
        snprintf(_ss_ret, _ss_size+1, ##__VA_ARGS__);           \
        _ss_ret;                                                \
    })
```
