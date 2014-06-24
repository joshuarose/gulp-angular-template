protractor = (require 'protractor').getInstance()

module.exports = ->
  @World = require('../support/homepage.coffee').World

  @Given /I am on the homepage/, (callback) ->
    @browser.get('http://localhost:3000').then ->
      callback()

  @When /I wait for angular/, (callback) ->
    console.log @browser
    console.log @By
    callback()

  @Then /I should see content/, (callback) ->
    # @browser.element(@By.id 'test').getAttribute('value').then (text) ->
    #   @assert.equal text, "Content2"
      callback()
