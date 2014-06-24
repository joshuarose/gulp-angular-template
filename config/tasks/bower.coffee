bower = require('gulp-bower')

module.exports = (gulp) ->
  gulp.task('bower', ['clean'], ->
    return bower()
      .pipe(gulp.dest('app/vendor/')))
