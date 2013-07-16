
assert = require 'assert'
request = require 'request'
app = require '../../server'

describe "authentication:", ->
    describe "GET /login", ->
        body = null
        before (done) ->
            options = 
                uri: "http://localhost:#{app.settings.port}/login"
            request options, (err, res, _body) ->
                body = _body
                done()
        it "has title", ->
            assert.hasTag body, '//head/title', "TheVault - Login"
        it "has user field", ->
            assert.hasTag body, '//input[@name="user"]', ''
        it "has password field", ->
            assert.hasTag body, '//input[@name="password"]', ''