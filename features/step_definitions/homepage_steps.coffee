module.exports = ->
  @World = require('../support/homepage.coffee').World

  @Given /I am on the homepage/, (callback) ->
    @browser.get('http://localhost:3000').then ->
      callback()

  @When /I wait for angular/, (callback) ->
    console.log "waiting..."
    callback()

  @Then /I should see content/, (callback) ->
    @browser.findElement(@By.id 'test').getText().then (text) ->
      @assert.equal text, "Content2"
      callback()
