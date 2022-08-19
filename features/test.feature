
Feature: Pagina de login


  @test @host:test
  Scenario: test.Happy Path
    Given Abro el portal "DealersWebTest"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @test @host:test
  Scenario: test.error
    Given Abro el portal "DealersWebTest"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @test @host:test
  Scenario: stage.Happy Path
    Given Abro el portal "DealersWebTest"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos

  @test @host:test
  Scenario: prod.Happy Path
    Given Abro el portal "DealersWebTest"
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos