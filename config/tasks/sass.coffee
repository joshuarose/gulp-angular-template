sass = require 'gulp-ruby-sass'
concat = require 'gulp-concat'
minifyCSS = require 'gulp-minify-css'
vendor = require '../files'
gulpif = require 'gulp-if'
livereload = require 'gulp-livereload'

module.exports = (gulp, notify, devEnv) ->
  gulp.task "sass", ['bower'], ->
    gulp.src(vendor.styles.concat [ "app/styles/main.sass"])
      .pipe(sass(sourcemap: false))
      .pipe(concat("app.css"))
      .pipe(gulpif(not devEnv, minifyCSS()))
      .pipe(gulp.dest("app/generated/css"))
      .pipe gulpif(devEnv, livereload())
      .pipe(gulpif(devEnv, notify('Sass is done')))
    return
