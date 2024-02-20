# language: pt

Funcionalidade: Pesquisar Funcionarios
  Para averiguar informações
  Eu como usuário do sistema 
  Desejo consultar informações dos Funcionarios

  Cenario: Buscar informações de funcionário
    Dado que o usuário consulte informações de funcionário
    Quando ele realizar a pesquisa
    Então uma lista de Funcionarios deve retornar

  @cenario_dois
  Cenario: Cadastrar funcionário
    Dado que o usuário deseja inserir um novo funcionário
    Quando ele enviar as informações do funcionário
    Então esse funcionário deve ser cadastrado