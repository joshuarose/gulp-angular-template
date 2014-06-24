module.exports = (gulp) ->
  gulp.task "dev", [
    "clean"
    "vendor"
    "coffee"
    "sass"
    "server"
    "watch"
  ]
