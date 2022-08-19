const webdriver = require('selenium-webdriver');
const chrome = require('selenium-webdriver/chrome');
const until = webdriver.until;
const Condition = webdriver.Condition;
const {setWorldConstructor, World } = require('@cucumber/cucumber')
const screen = {
  width: 1920,
  height: 1080
};
until.elementIsNotPresent = function elementIsNotPresent(locator) {
  return new Condition('for no element to be located ' + locator, function(driver) {
    return driver.findElements(locator).then(function(elements) {
      return elements.length === 0;
    });
  });
};
class CustomWorld extends World {
  driver = new webdriver.Builder()
      .forBrowser('chrome').setChromeOptions(new chrome.Options().headless().windowSize(screen)).build();
}
setWorldConstructor(CustomWorld)
