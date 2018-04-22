package js.uws;

@:enum abstract WebSocketEventType(String) to String {
    var Open = "open";
    var Close = "close";
    var Ping = "ping";
    var Pong = "pong";
    var Error = "error";
}