
Feature: Pagina de login


  @prod @environment:prod
  Scenario: Happy Path
    Given Abro el portal "DealersWebProd"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @prod @environment:prod
  Scenario: error
    Given Abro el portal "DealersWebProd"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @prod @feature:prod
  Scenario: Happy Path
    Given Abro el portal "DealersWebProd"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @prod @feature:prod
  Scenario: Happy Path
    Given Abro el portal "DealersWebProd"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos