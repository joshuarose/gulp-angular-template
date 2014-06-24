module.exports = (gulp) ->
  gulp.task "build", [
    "clean"
    "vendor"
    "coffee"
    "sass"
  ]
