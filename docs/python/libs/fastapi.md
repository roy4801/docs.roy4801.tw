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
    from typing import Optional

    @app.get("/items/{item_id}")
    async def read_item(item_id: str, q: Optional[str]=None):
        if q:
            return {'item_id': item_id, 'q': q}
        return {'item_id': item_id}
    ```

- Allow for multiple path parameters and query parameters at the same time. No nee

### Validations

!!!warning
    **Notice** It is not `#!python Optional` make FastAPI know the value is optional; The default value `= None` made it happened.

- Optional

    ```python linenums="1" hl_lines="4"
    from typing import Optional

    @app.get('/items/')
    def get_items(q: Optional[str] = None):
        # ...
    ```

- Query: provide additional validations for the query parameter
    - e.g. Limit the character length

    ```python linenums="1"
    from fastapi import Query

    @app.get('/optional/')
        def A(q: Optional[str] = Query(None, max_length=50)):
            # ...

    @app.get('/required/')
        def B(q: Optional[str] = Query(..., max_length=50)):
            # ...
    ```

    - parameters:
        - `min_length`
        - `max_length`
        - `regex`

### List / multiple values

You can declare the parameter as a list to receive multiple values.

```python linenums="1"
@app.get("/items/")
async def read_items(q: Optional[List[str]] = Query(None)):
    query_items = {"q": q}
    return query_items
```

THe URL looks like

```
http://localhost:8000/items/?q=foo&q=bar
```

And the value of `q` is

```
['foo', 'bar']
```

## Request Body

Use [`Pydantic`](https://pydantic-docs.helpmanual.io/) to delare the request body.

Advantages:

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

### Not using Pydantic model

!!!warning
    Must use with other model.

```python linenums="1"
class User(BaseModel):
    username: str
    full_name: Optional[str] = None

@app.post('/')
async def index(user: User, a: int = Body(...)):
    return {'a': a, **user.dict()}
```

<img src="https://i.imgur.com/c4qswiA.png" width=50%>

## Form
 
!!!warning
    Install `python-multipart` first. `pip install python-multipart`

```python linenums="1"
from fastapi import Form

@app.post('/')
async def index(user: str=Form(...), passwd: str=Form(...)):
    return {'user': user, 'passwd': passwd}
```

<img src="https://i.imgur.com/zKKTtMJ.png" width=50%>

!!!info
    Data form 通常是 encode 成 `application/x-www-form-urlencoded`，但如果有要傳檔案的話，就會 encode 成 `multipart/form-data`
    詳見: <https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/POST>

!!!danger
    `Form()` 和 `Body()` 混用可能導致非預期結果: 因為 HTML form 是用 `application/x-www-form-urlencoded` 並非 `application/json` 所以試圖用 `Body()` 來拿 JSON 是錯的

TODO

## Cookie

- Cookie parameter

```python linenums="1" hl_lines="4"
from fastapi import Cookie

@app.get('/needCookie')
def need_cookie_route(test: Optional[str] = Cookie(...)):
    return test
```

- Set cookie

```python linenums="1" hl_lines="5"
from fastapi import Response

@app.get('/cookie')
def set_cookie(response: Response):
    response.set_cookie(key='test', value='fuck you')
    return {'message': 'success'}
```

<https://fastapi.tiangolo.com/advanced/response-cookies/>
<https://fastapi.tiangolo.com/tutorial/cookie-params/>

## Template

Need to install `jinja2`

```python linenums="1"
from starlette.templating import Jinja2Templates

templates = Jinja2Templates(directory='templates')

@app.get('/')
async def main(request: Request):
    return template.TemplateResponse('index.html', {'request': request})
```


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