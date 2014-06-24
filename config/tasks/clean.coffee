rimraf = require('rimraf')

module.exports = (gulp) ->
  gulp.task('clean', (cb) ->
    rimraf('app/generated/', cb))
