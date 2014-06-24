nodemon = require 'gulp-nodemon'
livereload = require 'gulp-livereload'

module.exports = (gulp) ->
  gulp.task "server", ->
    nodemon
      script: "./server/server.coffee"
      ignore: [
        "app/"
        "_site/"
        "config/"
        "app/generated/"
        "app/features/"
        "tmp/"
        "app/vendor/"
      ]
    livereload.listen()
    return
