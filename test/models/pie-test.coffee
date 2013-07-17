
assert = require 'assert'
Pie    = require '../../models/pie'

describe 'Pie', ->
    describe 'create', ->
        pie = null
        before ->
            pie = new Pie {name: "Key Lime"}
        it "should set name", ->
            assert.equal pie.name, "Key Lime"
        it "should default to some state", ->
            assert.equal pie.state, "inactive"
        it "should generate Id", ->
            assert.equal pie.id, "Key_Lime"