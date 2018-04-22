# Haxe extern for uws
Haxe extern definitions for !(npm uws)[https://www.npmjs.com/package/uws].

## Install
`haxelib install extern-uws`

## Example 1 : Websocket
### Server
```haxe
var server = new UwsServer({ port: 3000 });
server.on(ServerEventType.Listening, function () {
    trace("Listening started");
});

server.on(ServerEventType.Connection, function (ws) {
    ws.onping = function () {
        trace("ping");
    }
    ws.onpong = function () {
        trace("pong");
    }
    ws.onmessage = function (event) {
        trace("message");
        trace(event);
    }
    ws.onclose = function (event) {
        trace("close");
    }
    
    ws.ping();

    // send text message
    ws.send("hello");

    // send binary message
    ws.send(Buffer.from("こんにちわ世界", "utf-8"), { binary: true });

    haxe.Timer.delay(function () {
        ws.close();
    }, 2000);
});

server.on(ServerEventType.Error, function (err) {
    trace(err);
});
```

### Client
```haxe
var client = new Uws("ws://localhost:3000/");

client.onopen = function () {
    client.send("hello");
}

client.onmessage = function () {
    console.log("message");
    console.log(arguments);
}

client.onping = function (message) {
    trace("ping");
    trace(message);
}

client.onpong = function () {
    trace("pong");
}

client.onclose = function (event) {
    trace("close");
    trace(event);
}

client.onerror = function (err) {
    trace("error");
    trace(err);
}
```


## Example 2 : HTTP Server with Koa.js
```haxe
var app = new Koa();
app.use(ctx => {
    ctx.body = "Hello World!";
});

var server = UwsHttp.createServer(app.callback());
server.listen(3000);
```