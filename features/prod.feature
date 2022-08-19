
Feature: Pagina de login


  @prod @message:prod
  Scenario: Happy Path
    Given Abro el portal "DealersWebProd"
    Then Espero 3 segundos
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @prod @message:prod
  Scenario: Email incorrecto
    Given Abro el portal "DealersWebProd"
    Then Espero 3 segundos
    Then Ingreso "admin123@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @prod @message:prod
  Scenario: Contraseña incorrecta
    Given Abro el portal "DealersWebProd"
    Then Espero 3 segundos
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal123" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @prod @message:prod
  Scenario: Email y contraseña incorrecta
    Given Abro el portal "DealersWebProd"
    Then Espero 3 segundos
    Then Ingreso "admin123@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal123" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos