# Description
#   Random CommitStrip
#
# Configuration:
#   COMMITSTRIP_DEFAULT_LANGUAGE
#
# Commands:
#   hubot commitstrip [latest]
#
# Author:
#   Loïc Mahieu <mahieuloic@gmail.com>

lib = require './lib/commitstrip-lib'

module.exports = (robot) ->
  robot.respond /commitstrip( latest)?/, (res) ->
    lib.latest().then (strip) ->
      res.reply """
        #{strip.title}
        #{strip.image}
      """
