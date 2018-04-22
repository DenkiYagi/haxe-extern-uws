package;

import js.uws.UwsServer;
import js.node.Buffer;

class Main {
    public static function main() {
        var server = new UwsServer({ port: 3000 });
        server.on(ServerEvent.Listening, function () {
            trace("Listening started");
        });

        server.on(ServerEvent.Connection, function (ws) {
            ws.onping = function (msg) {
                trace("ping");
            }
            ws.onpong = function (msg) {
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
                ws.terminate();
            }, 2000);
        });

        server.on(ServerEvent.Error, function (err) {
            trace(err);
        });
    }
}