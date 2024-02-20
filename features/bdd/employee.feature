# language: pt

Funcionalidade: Pesquisar Funcionarios
  Para averiguar informações
  Eu como usuário do sistema 
  Desejo consultar informações dos Funcionarios

  @cenario_um
  Cenario: Buscar informações de funcionário
    Dado que o usuário consulte informações de funcionário
    Quando ele realizar a pesquisa
    Então uma lista de Funcionarios deve retornar

  @cenario_dois
  Cenario: Cadastrar funcionário
    Dado que o usuário deseja inserir um novo funcionário
    Quando ele enviar as informações do funcionário
    Então esse funcionário deve ser cadastrado

  @cenario_tres
  Cenario: Alterar informações cadastrais
    Dado que o usuário deseje alterar alguma informação de um funcionário
    Quando ele enviar as novas informações
    Então as informações serão alteradas
  
  @cenario_quatro
  Cenario: Deletar cadastro de funcionário
    Dado que o usuário deseja deletar os dados de um funcionário
    Quando ele enviar a identificação única
    Então esse funcionário será deletado do sistema