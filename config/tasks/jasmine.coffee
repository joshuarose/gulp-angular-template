paths = require '../paths'
jasmine = require 'gulp-jasmine'

module.exports = (gulp) ->
  gulp.task('jasmine', ->
    gulp.src(paths.tests)
      .pipe(jasmine()))
