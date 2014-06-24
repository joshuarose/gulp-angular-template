bower = require('gulp-bower')

module.exports = (gulp) ->
  gulp.task('bower', ->
    return bower()
      .pipe(gulp.dest('app/vendor/')))
