chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'commitstrip', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/commitstrip')(@robot)

  describe 'latest', ->
    it 'registers a response listener', ->
      expect(@robot.respond).to.have.been.calledWith /commitstrip( latest)?/
