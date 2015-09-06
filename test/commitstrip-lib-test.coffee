chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

lib = require '../src/lib/commitstrip-lib'

imgReg = new RegExp [
  '^'
  'http:\/\/www\.commitstrip\.com\/'
  'wp-content\/uploads\/([0-9]{4})\/([0-9]{2})\/(.*)\.jpg'
  '$'
].join('')

urlReg = new RegExp [
  '^'
  'http:\/\/www\.commitstrip\.com\/'
  '(en|fr)\/([0-9]{4})\/([0-9]{2})\/(.*)'
  '$'
].join('')

describe 'commitstrip-lib', ->
  describe 'latest', ->
    it 'can get latest strip with the default language', ->
      lib.latest().then (strip) ->
        expect(strip.image).to.match(imgReg)
        expect(strip.url).to.match(urlReg)
        expect(strip.title).to.be.ok
    it 'can get latest strip with the `fr` language', ->
      lib.latest('fr').then (strip) ->
        expect(strip.image).to.match(imgReg)
        expect(strip.url).to.match(urlReg)
        expect(strip.title).to.be.ok
    it 'can get latest strip with the `en` language', ->
      lib.latest('en').then (strip) ->
        expect(strip.image).to.match(imgReg)
        expect(strip.url).to.match(urlReg)
        expect(strip.title).to.be.ok
