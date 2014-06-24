devEnv = process.env.NODE_ENV == 'development'

gulp = require 'gulp'

notify = require 'gulp-notify'
nn = require 'node-notifier'
notifier = new nn()

require('./tasks/clean')(gulp)
require('./tasks/vendor')(gulp, devEnv)
require('./tasks/coffee')(gulp, notify, devEnv)
require('./tasks/sass')(gulp, notify, devEnv)
require('./tasks/server')(gulp)
require('./tasks/watch')(gulp)
require('./tasks/spec_watch')(gulp)
require('./tasks/test')(gulp)
require('./tasks/ci')(gulp)
require('./tasks/dev')(gulp)
require('./tasks/build')(gulp)
require('./tasks/default')(gulp)
require('./tasks/bower')(gulp)
require('./tasks/cucumber')(gulp)
require('./tasks/selenium')(gulp)
require('./tasks/images')(gulp)
