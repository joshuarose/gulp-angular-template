paths = require '../paths'

module.exports = (gulp) ->
  gulp.task "spec-watch", ->
    gulp.watch [
      paths.features
      paths.scripts
      paths.templates
    ], [
      "coffee"
      "cucumber"
    ]
    return
