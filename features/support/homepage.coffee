assert = require 'assert'
path = require 'path'
protractor = require 'protractor'
webdriver = require 'selenium-webdriver'

driver = new webdriver.Builder().
  usingServer('http://localhost:4444/wd/hub').
  withCapabilities(webdriver.Capabilities.chrome()).
  build()

driver.manage().timeouts().setScriptTimeout(100000)

# ptor = protractor.wrapDriver(driver, "http://localhost:3000", "body")
ptor = protractor.wrapDriver driver

class World
  constructor: (callback) ->
    @browser = ptor
    @By = ptor.driver.By
    @assert = assert
    callback()

module.exports.World = World
