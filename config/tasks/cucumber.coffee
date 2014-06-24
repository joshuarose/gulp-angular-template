child_process = require('child_process')
cuke_running = false

cuke_options = [
  "node_modules/.bin/cucumber-js",
  "features",
  "-r", "features/step_definitions",
  "-f", "pretty"
]

module.exports = (gulp) ->
  gulp.task('cucumber', ['server'], ->
    if(!cuke_running)
      running = true
      cucumber = child_process.spawn('node', cuke_options)
                      .on('exit', ->
                        cuke_running = false
                        cucumber.stdout.on('data', (d) ->
                          console.log(String(d)) if d)
                        cucumber.stderr.on('data', (d) ->
                          console.error(String(d)) if d)))
