## Aplicacion tiempo extra

### Requerimiento principal: La compañia necesita informacion si los empleados realizaron o no horas extras en la semana

### Modelos
* Post -> date:date rationale:text
* User -> Devise
* AdminUser -> STI

## Caracteristicas
* Flujo de trabajo (aprovacion o desaprobacion)
* Servicio de mensajeria (twilio api) -> integrar con el scheduler de heroku
* Panel administrativo (Administrate)
* Servicio correo
* Auditoria

## Herramientas
* UI
  * Bootstrap
* APIs de terceros
  * Twilio
* Gemas
  * Devise
  * Administrate
* Herramientas de prueba
  * Rspec
  * Capybara

## TODO refactor
* Asociacion usuario a post
* Refactor post/_form for role authorization
