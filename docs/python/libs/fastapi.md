# fastapi

## Http

```python linenums="1"

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

## Websocket

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