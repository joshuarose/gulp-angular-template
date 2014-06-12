gulp = require('gulp')
coffee = require('gulp-coffee')
concat = require('gulp-concat')
uglify = require('gulp-uglify')
imagemin = require('gulp-imagemin')
rimraf = require('rimraf')
bower = require('gulp-bower')
templateCache = require('gulp-angular-templatecache')
coffeelint = require('gulp-coffeelint')
sass = require('gulp-ruby-sass')
minifyCSS = require('gulp-minify-css')
nodemon = require('gulp-nodemon')
clean = require('gulp-clean')
streamqueue = require('streamqueue')
jshint = require('gulp-jshint')
htmlhint = require('gulp-htmlhint')
protractor = require('gulp-protractor').protractor


paths = {
  scripts: ['client/js/**/*.coffee', '!client/external/**/*.coffee'],
  images: 'client/img/**/*'
}

vendor = [
    "bower_components/jquery/dist/jquery.js",
    "bower_components/angular/angular.js",
    "bower_components/bootstrap-sass/dist/js/bootstrap.js",
    "bower_components/underscore/underscore.js"
]

gulp.task('clean', (cb) ->
  rimraf('build/', cb))

gulp.task('scripts', ['clean'], ->
  return gulp.src(paths.scripts)
    .pipe(coffee())
    .pipe(uglify())
    .pipe(concat('all.min.js'))
    .pipe(gulp.dest('build/js')))

gulp.task('images', ['clean'], ->
 return gulp.src(paths.images)
    .pipe(imagemin({optimizationLevel: 5}))
    .pipe(gulp.dest('build/img')))

gulp.task('watch', ->
  gulp.watch(paths.scripts, ['scripts'])
  gulp.watch(paths.images, ['images']))

gulp.task('bower', ->
  return bower()
    .pipe(gulp.dest('lib/')))

gulp.task 'default', ['bower','scripts', 'images', 'watch']
