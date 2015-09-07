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

assertStrip = (strip) ->
  expect(strip.image).to.match(imgReg)
  expect(strip.url).to.match(urlReg)
  expect(strip.title).to.be.ok

describe 'commitstrip-lib', ->
  describe 'latest', ->
    it 'can get latest strip with the default language', ->
      lib.latest().then assertStrip
    it 'can get latest strip with the `fr` language', ->
      lib.latest('fr').then assertStrip
    it 'can get latest strip with the `en` language', ->
      lib.latest('en').then assertStrip

  describe 'pageCount', ->
    it 'can get page count', ->
      lib.pageCount().then (count) ->
        expect(count).to.be.a('number')

  describe 'random', ->
    it 'can get a random strip', ->
      lib.random().then assertStrip

  describe 'byNumber', ->
    it 'can get a strip from page number', ->
      lib.byNumber(1).then assertStrip
