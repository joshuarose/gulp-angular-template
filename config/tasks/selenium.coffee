child_process = require('child_process')

selenium_running = false

module.exports = (gulp) ->
  gulp.task('selenium', ['server'], ->
    if(!selenium_running)
      selenium_running = true
      selenium = child_process.spawn('node_modules/protractor/bin/webdriver-manager start')
                      .on('exit', ->
                        selenium_running = false
                        selenium.stdout.on('data', (d) ->
                          console.log(String(d)) if d)
                        selenium.stderr.on('data', (d) ->
                          console.error(String(d)) if d)))
