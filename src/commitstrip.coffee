# Description
#   Random CommitStrip
#
# Configuration:
#   COMMITSTRIP_DEFAULT_LANGUAGE
#
# Commands:
#   hubot commitstip latest
#
# Author:
#   Loïc Mahieu <mahieuloic@gmail.com>

lib = require './commitstrip-lib'

module.exports = (robot) ->
  robot.respond /commitstrip latest/, (res) ->
    lib.latest().then (imageUrl) ->
      res.reply imageUrl
