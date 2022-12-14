const { Then, Given } = require('@cucumber/cucumber');
const {By} = require("selenium-webdriver");
Then('Espero {int} segundos',{timeout: 60 * 1000}, function (int1) {
  return this.driver.sleep(int1*1000)
});
Given(/^Abro el portal "([^"]*)"$/,{timeout: 60 * 1000}, function (str1) {
  if (str1 === "DealersWebTest") {
    return this.driver.get('http://test.daimlerpoc.qacg.cloud');
  }else if (str1 === "DealersWebStage"){
    return this.driver.get('http://stage.daimlerpoc.qacg.cloud');
  }else if (str1 === "DealersWebProd"){
    return this.driver.get('http://daimlerpoc.qacg.cloud');
  }
});

Then(/^Ingreso "([^"]*)" en el campo "([^"]*)"$/,{timeout: 60 * 1000}, function (str1,str2) {
  if (str2 === "Correo electronico"){
    return this.driver.findElement({id:"email"}).sendKeys(str1);
  }else if (str1 === "DealersWebStage"){
    return this.driver.findElement({id:"password"}).sendKeys(str1);
  }
});
Then(/^Hago click en el boton "([^"]*)"$/,{timeout: 60 * 1000}, function (str1) {
  if (str1 === "Iniciar Sesion"){
    return this.driver.findElement(By.xpath("//button[contains(., 'Iniciar')]")).click();
  }
});