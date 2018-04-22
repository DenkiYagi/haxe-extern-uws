package js.uws;

@:enum abstract ServerEventType(String) to String {
    var Listening = "listening";
    var Connection = "connection";
    var Error = "error";
}