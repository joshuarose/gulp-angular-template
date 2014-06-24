paths = require '../paths'

module.exports = (gulp) ->
  gulp.task "watch", ['bower'], ->
    gulp.watch [
      paths.scripts
      paths.templates
    ], ["coffee"]
    gulp.watch paths.sass, ["sass"]
    return
