package js.uws;

import js.node.http.IncomingMessage;
import js.node.http.ServerResponse;

@:jsRequire("uws", "http")
extern class UwsHttp {
    static function createServer(?app: IncomingMessage -> ServerResponse -> Void): UwsHttp;
    static function getExpressApp(express: Dynamic): Dynamic;
    static function getResponsePrototype(): ServerResponse;
    static function getRequestPrototype(): IncomingMessage;

    function listen(port: Int): Void;
}
