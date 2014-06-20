gulp = require('gulp')
gulpLoadPlugins = require('gulp-load-plugins')
plugins = gulpLoadPlugins()
rimraf = require('rimraf')


paths = {
  scripts: ['app/scripts**/*.coffee', '!app/external/**/*.coffee'],
  images: 'app/images/**/*',
  stylesheets: 'app/stylesheets/*.sass'
}

vendor = [
  "app/vendor/angular/angular.js",
  "app/vendor/bootstrap-sass/affix.js",
  "app/vendor/bootstrap-sass/alert.js",
  "app/vendor/bootstrap-sass/button.js",
  "app/vendor/bootstrap-sass/carousel.js",
  "app/vendor/bootstrap-sass/collapse.js",
  "app/vendor/bootstrap-sass/dropdown.js",
  "app/vendor/bootstrap-sass/modal.js",
  "app/vendor/bootstrap-sass/popover.js",
  "app/vendor/bootstrap-sass/scrollspy.js",
  "app/vendor/bootstrap-sass/tab.js",
  "app/vendor/bootstrap-sass/tooltip.js",
  "app/vendor/bootstrap-sass/transition.js",
  "app/vendor/jquery/jquery.js",
  "app/vendor/underscore/underscore.js"
]

gulp.task('clean', (cb) ->
  rimraf('generated/', cb))

gulp.task('scripts', ['clean'], ->
  return gulp.src(paths.scripts)
    .pipe(plugins.coffee())
    .pipe(plugins.concat('nightride.min.js'))
    .pipe(plugins.ngmin({dynamic: true}))
    .pipe(plugins.uglify())
    .pipe(gulp.dest('generated/js')))

gulp.task('images', ['clean'], ->
 return gulp.src(paths.images)
    .pipe(plugins.imagemin({optimizationLevel: 5}))
    .pipe(gulp.dest('generated/img')))

gulp.task('watch', ->
  gulp.watch(paths.scripts, ['scripts'])
  gulp.watch(paths.images, ['images'])
  gulp.watch(paths.stylesheets, ['gulp-sass']))

gulp.task('vendor', ['bower'], ->
    return gulp.src(vendor)
      .pipe(plugins.concat('vendor.js'))
      .pipe(plugins.ngmin())
      .pipe(plugins.uglify())
      .pipe(gulp.dest('generated/js')))

gulp.task('bower', ->
  return plugins.bower()
    .pipe(gulp.dest('app/vendor/')))

gulp.task 'default', ['bower','scripts', 'vendor', 'images', 'watch']
