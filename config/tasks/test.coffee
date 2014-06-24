module.exports = (gulp) ->
  gulp.task "test", [
    "clean"
    "sass"
    "vendor"
    "cucumber"
    "spec-watch"
  ]
