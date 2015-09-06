
fetch = require 'node-fetch'
cheerio = require 'cheerio'

language = (l) ->
  (l || process.env.COMMITSTRIP_DEFAULT_LANGUAGE || 'en')
    .toLowerCase()

makeUrl = (l) ->
  "http://www.commitstrip.com/#{language(l)}/"

latest = (l) ->
  fetch(makeUrl(l))
    .then (res) -> res.text()
    .then (body) ->
      $ = cheerio.load body
      $('.post img').attr('src')

module.exports =
  latest: latest
