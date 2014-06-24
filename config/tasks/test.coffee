paths = require '../paths'
jasmine = require 'gulp-jasmine'

module.exports = (gulp) ->
  gulp.task('test', ->
    gulp.src(paths.tests)
      .pipe(jasmine()))
