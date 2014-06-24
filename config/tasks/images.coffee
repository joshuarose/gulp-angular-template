paths = require '../paths'
imagemin = require 'gulp-imagemin'

module.exports = (gulp) ->
  gulp.task('images', ['clean'], ->
    return gulp.src(paths.images)
      .pipe(imagemin({optimizationLevel: 5}))
      .pipe(gulp.dest('app/generated/img')))
