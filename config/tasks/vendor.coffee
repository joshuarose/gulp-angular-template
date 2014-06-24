concat = require 'gulp-concat'
vendor = require '../files'
ngmin = require 'gulp-ngmin'
gulpif = require 'gulp-if'

module.exports = (gulp, devEnv) ->
  gulp.task "vendor",['bower'], ->
    gulp.src(vendor.scripts)
      .pipe(concat("vendor.js"))
      .pipe(gulpif(not devEnv, ngmin()))
      .pipe gulp.dest("app/generated/js")
