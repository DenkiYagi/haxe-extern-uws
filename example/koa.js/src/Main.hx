package;

import js.koa.Koa;
import js.uws.UwsHttp;

class Main {
    public static function main() {
        var app = new Koa();
        app.use(function (ctx, next) {
            ctx.body = "Hello World!";
        });

        var server = UwsHttp.createServer(app.callback());
        server.listen(3000);
    }
}