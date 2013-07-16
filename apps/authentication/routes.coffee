
routes = (app) ->

    app.get '/login', (req, res) ->
        res.render "#{__dirname}/views/login",
        title: "Login"
        style: "login"

    app.post '/sessions', (req, res) ->
        if ('johnkacz' is req.body.user) and ('opensezme' is req.body.password)
            req.session.currentUser = req.body.user
            req.flash 'info', "You are logged in as #{req.session.currentUser}"
            res.redirect '/login'
            return
        req.session.currentUser = null
        req.flash 'error', "Those credentials are incorrect. Please try again."
        res.redirect '/login'
        
module.exports = routes
