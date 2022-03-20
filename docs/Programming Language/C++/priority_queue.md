# priority_queue - Heap

```cpp linenums="1"
#include <priority_queue>
```

## Construct

```cpp linenums="1"
// Max Heap
priority_queue<int> pq;

// Min Heap
priority_queue<int, vector<int>, greater<int>> pq;
```

## Operations

```cpp linenums="1"
// Push
pq.push(1);

// Access
auto x = pq.top();

pq.pop();
```

## In `<algorithm>`

Use 
