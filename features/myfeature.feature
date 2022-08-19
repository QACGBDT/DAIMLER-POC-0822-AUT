
Feature: Pagina de registro


  @issue=TEST-1
  Scenario: Happy Path
    Given Abro el portal DealersWeb
    Then Ingreso "admin@qacg.com" en el campo "Correo electronico"
    Then Ingreso "T3mporal" en el campo "Contraseña"
    Then Hago click en el boton "Iniciar Sesion"
    Then Espero 3 segundos


