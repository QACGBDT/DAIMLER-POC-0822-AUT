const { Then, Given } = require('@cucumber/cucumber');

  Then('Selecciono {genero} como mi genero',{timeout: 60 * 1000}, function (str1) {
    if (str1 === "masculino"){
      return this.driver.findElement({id:"male"}).click();
    }
    else{
      return this.driver.findElement({id:"female"}).click();
    }
  });
  Then('Ingreso mi numero exterior',{timeout: 60 * 1000}, function () {
  return this.driver.findElement({id:"outdoorNumber"}).sendKeys('613');
  })
Then('Espero {int} segundos',{timeout: 60 * 1000}, function (int1) {
  return this.driver.sleep(int1*1000)
});
Given(/^Abro el portal "([^"]*)"$/, function (str1) {
  if (str1 === "DealersWebTest") {
    return this.driver.get('http://daimlerpoc.qacg.cloud');
  }else if (str1 === "DealersWebStage"){
    return this.driver.get('http://stage.daimlerpoc.qacg.cloud');
  }else if (str1 === "DealersWebProd"){
    return this.driver.get('http://daimlerpoc.qacg.cloud');
  }
});

Then(/^Ingreso "([^"]*)" en el campo "([^"]*)"$/, function (str1,str2) {
  if (str2 === "Correo electronico"){
    return this.driver.findElement({id:"email"}).sendKeys(str1);
  }else if (str1 === "DealersWebStage"){
    return this.driver.findElement({id:"password"}).sendKeys(str1);
  }
});
Then(/^Hago click en el boton "([^"]*)"$/, function (str1) {
  if (str1 === "Iniciar Sesion"){
    return this.driver.findElement({text:" Iniciar Sesión "}).click();
  }
});