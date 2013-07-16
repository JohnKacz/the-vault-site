
/**
 * Module dependencies.
 */

require('coffee-script');

var express = require('express'),
    RedisStore = require('connect-redis')(express),
    flash = require('connect-flash'),
    http = require('http'),
    path = require('path');

var app = module.exports = express();

// var sessionStore = new RedisStore({
//     host: 'localhost',
//     port: 6379
// });

var sessionOptions = {
    // store: sessionStore,
    store: new RedisStore,
    secret: 'sessionID123110495861304613098650387452875163405938467582734519248735',
    cookie: {
      path: '/',
      httpOnly: true,
      maxAge: 1000 * 60 * 60 * 24 * 90 // expire after 90 days
    }
};

// all environments
app.set('port', process.env.PORT || 3000);
app.set('views', __dirname + '/views');
app.set('view engine', 'jade');
app.use(express.favicon(__dirname + '/public/favicon.ico'));
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(express.cookieParser());
app.use(express.session({
    secret: "sessionID123110495861304613098650387452875163405938467582734519248735",
    store: new RedisStore
}));
app.use(flash());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}
else if ('test' == app.get('env')) {
  app.set('port', 3001);
}

// routes
// app.get('/', routes.index);
// app.get('/users', user.list);
console.log(app.session);
require('./apps/authentication/routes')(app);


http.createServer(app).listen(app.get('port'), function(){
console.log("Express server listening on port %s in %s mode", app.settings.port, app.settings.env);
});
