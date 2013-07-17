
Pie = require '../../models/pie'

routes = (app) ->
    app.namespace '/admin', ->

        app.namespace '/pies', ->

            app.get '/', (req, res) ->
                pie = new Pie {}
                res.render "#{__dirname}/views/pies/all",
                    title: "View All Pies"
                    style: "admin"
                    pie: pie

            app.post '/', (req, res) ->

module.exports = routes
