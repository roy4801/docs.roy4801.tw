# fastapi

## Route

- `HTTPEndpoint`

```python
from fastapi.responses import FileResponse
from fastapi.responses import HTMLResponse
from fastapi.responses import JSONResponse
from fastapi.responses import PlainTextResponse
from fastapi.responses import RedirectResponse
from fastapi.responses import Response
from fastapi.responses import StreamingResponse
from fastapi.responses import UJSONResponse

@app.route('/your/route/{param1}')
class ChatListing(HTTPEndpoint):
    async def get(self, request):
        params = request['path_params']

        # Do things ...

        return <response>
```