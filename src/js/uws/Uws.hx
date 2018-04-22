package js.uws;

@:jsRequire("uws")
extern class Uws extends WebSocket {
    static var OPEN(default, never): Int;
    static var CLOSED(default, never): Int;

    function new(uri: String);
}
