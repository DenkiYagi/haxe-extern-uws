package;

import js.uws.Uws;

class Main {
    public static function main() {
        var client = new Uws("ws://localhost:3000/");

        client.onopen = function () {
            client.send("hello");
        }

        client.onmessage = function (event) {
            trace("message");
            trace(event);
        }

        client.onping = function (message) {
            trace("ping");
            trace(message);
        }

        client.onpong = function (message) {
            trace("pong");
            trace(message);
        }

        client.onclose = function (event) {
            trace("close");
            trace(event);
        }

        client.onerror = function (err) {
            trace("error");
        }
    }
}