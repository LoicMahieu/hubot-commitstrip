chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

lib = require '../src/commitstrip-lib'

imgReg = new RegExp [
  '^'
  'http:\/\/www\.commitstrip\.com\/'
  'wp-content\/uploads\/([0-9]{4})\/([0-9]{2})\/(.*)\.jpg'
  '$'
].join('')

describe 'commitstrip-lib', ->
  describe 'latest', ->
    it 'can get latest strip with the default language', ->
      lib.latest().then (imageUrl) ->
        expect(imageUrl).to.match(imgReg)
    it 'can get latest strip with the `fr` language', ->
      lib.latest('fr').then (imageUrl) ->
        expect(imageUrl).to.match(imgReg)
    it 'can get latest strip with the `en` language', ->
      lib.latest('en').then (imageUrl) ->
        expect(imageUrl).to.match(imgReg)
