# fastapi

## Installation

```bash linenums="1"
pip install fastapi[all] uvicorn[standard]
```

Test to see if it installed successfully

```
>>> from fastapi import FastAPI
>>> app = FastAPI()
>>> app
<fastapi.applications.FastAPI object at 0x107040c70>
```

## Query Method

- HTTP methods
    - common
        - GET
        - POST
        - PUT
        - DELETE
    - exotic ones
        - OPTIONS
        - HEAD
        - PATCH
        - TRACE

```python linenums="1"
@app.post('/route')
@app.get('/route')
def route_controller():
    return {'msg' : 'Im route'}
```

## Path Parameters

```python linenums="1"
@app.get('/items/{item_id}')
async def read_item(item_id: int):
    return {'item_id': item_id}
```

#### Enum

```python linenums="1"
from enum import Enum

class TypeName(str, Enum):
    type_a = 'A'
    type_b = 'B'
    type_c = 'C'

@app.get('/types/{type_name}')
async def get_type(type_name: TypeName):
    return {'type_name': type_name}
```

![](http://i.imgur.com/fnntcZu.png)
![](http://i.imgur.com/TrJOHgr.png)

#### File Path

```python linenums="1"
@app.get("/files/{file_path:path}")
async def read_file(file_path: str):
    return {"file_path": file_path}
```

## Query Parameters

- GET parameters
    - To make it Required, just remove the default value

    ```python linenums="1"
    @app.get("/items/")
    async def read_item(skip: int, limit: int=10):
        return {'skip': skip, 'limit': limit}
    ```

- Optional parameters

    ```python linenums="1"
    @app.get("/items/{item_id}")
    async def read_item(item_id: str, q: Optional[str]=None):
        if q:
            return {'item_id': item_id, 'q': q}
        return {'item_id': item_id}
    ```

- Allow for multiple path parameters and query parameters at the same time. No nee

## Request Body

Use [`Pydantic`](https://pydantic-docs.helpmanual.io/) to delare the request body.
Benefits:
- Read the request body as JSON
- Convert the corresponding type
- Validate the data
- Gernerate JSON Schema for the model
- Editor support

```python linenums="1"
from pydantic import BaseModel

class Item(BaseModel):
    name: str
    description: Optional[str] = None
    price: float
    tax: Optional[float] = None

@app.post("/items/")
async def create_item(item: Item):
    return item
```

<img src="https://i.imgur.com/3S2HPQS.png" width=50%>

### Not use Pydantic model

TODO

## Endpoints
### Http

```python linenums="1"
@app.get("/")
async def root():
    return {"message": "Hello World"}
```

#### Use `starlette.endpoints.HTTPEndpoint`

```python
from starlette.endpoints import HTTPEndpoint
from starlette.responses import HTMLResponse

@app.route('/<route>/{arg}')
class Homepage(HTTPEndpoint):
    async def get(self, request):
        path_params = request.path_params
        query_params = request.query_params
        return HTMLResponse(html)
```

### Websocket

- Controller of a websocket route
    - Send
        - `.send_text()`
        - `.send_bytes()`
        - `.send_json()`

```python linenums="1"
@app.websocket("/ws")
async def websocket_endpoint(websocket: WebSocket):
    await websocket.accept()
    while True:
        try:
            s = await websocket.receive_text()
            await websocket.send_text(s)
        except Exception as e:
            print('error:', e)
            break
```

#### Use `starlette.endpoints.WebSocketEndpoint`

```python linenums="1"
from starlette.endpoints import WebSocketEndpoint

@app.websocket_route("/ws")
class Endpoint(WebSocketEndpoint):
    encoding = 'text'

    async def on_connect(self, websocket):
        await websocket.accept()

    async def on_receive(self, websocket, data):
        await websocket.send_text(f'Message text was: {data}')

    async def on_disconnect(self, websocket, close_code):
        pass
```