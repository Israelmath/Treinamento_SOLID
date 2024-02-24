Feature: Login
  Como um cliente
  Quero poder acessar minha conta e me manter logado
  Para que eu possa acessar e responder enquetes de forma rápida

Scenario: Credenciais válidas
  Dado que o cliente informou credenciais válidas
  Quando solicitar para fazer login
  Então o sistema deve enviar o usuári para a tela de pesquisas
  E manter o usuário conectado

Scenario: Credenciais inválidas
  Dado que o cliente informou credenciais inválidas
  Quando solicitar fazer login
  Então o sistema deve retornar uma mensagem de erro
