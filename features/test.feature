
Feature: Pagina de login


  @test @message:test
  Scenario: Happy Path
    Given Abro el portal "DealersWebTest"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @test @message:test
  Scenario: Email incorrecto
    Given Abro el portal "DealersWebTest"
    Then Ingreso "admin123@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @test @message:test
  Scenario: Contraseña incorrecta
    Given Abro el portal "DealersWebTest"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal123" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @test @message:test
  Scenario: Email y contraseña incorrecta
    Given Abro el portal "DealersWebTest"
    Then Ingreso "admin123@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal123" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos