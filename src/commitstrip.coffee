# Description
#   CommitStrip directly in your Hubot!
#
# Configuration:
#   COMMITSTRIP_DEFAULT_LANGUAGE
#
# Commands:
#   hubot commitstrip [latest] - Get latest CommitStrip
#   hubot commitstrip random - Get random CommitStrip
#
# Author:
#   Loïc Mahieu <mahieuloic@gmail.com>

lib = require './lib/commitstrip-lib'

module.exports = (robot) ->
  replyStrip = (res) ->
    (strip) ->
      res.reply """
        #{strip.title}
        #{strip.image}
      """

  robot.respond /commitstrip( latest)?/, (res) ->
    lib.latest().then replyStrip(res)
  robot.respond /commitstrip random/, (res) ->
    lib.random().then replyStrip(res)
