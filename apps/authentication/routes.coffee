
routes = (app) ->

    app.get '/login', (req, res) ->
        res.render "#{__dirname}/views/login",
            title: "Login"
            style: "login"
            user: req.session.currentUser
            messages: req.flash() 

    app.post '/sessions', (req, res) ->
        if ('johnkacz' is req.body.user) and ('opensezme' is req.body.password)
            req.session.currentUser = req.body.user
            req.flash 'info', "You are logged in as #{req.session.currentUser}!"
            res.redirect '/login'
            return
        req.flash 'error', "Those credentials are incorrect. Please try again."
        res.redirect '/login'

    app.get '/logout', (req, res) ->
        req.session.regenerate (err) ->
            req.flash 'info', "You have successfully been logged out. Come back soon!"
            res.redirect '/login'

    app.del '/sessions', (req, res) ->
        req.session.regenerate (err) ->
            req.flash 'info', "You have successfully been logged out. Come back soon!"
            res.redirect '/login'
        
module.exports = routes
