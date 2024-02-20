Dado('que o usuário consulte informações de funcionário') do
  @getlist = Employee_Requests.new
end

  Quando('ele realizar a pesquisa') do
    @list_employee = @getlist.find_employee
  end

  Então('uma lista de Funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
  end

Dado('que o usuário deseja inserir um novo funcionário') do
  @create = Employee_Requests.new
  @name = Faker::Name.name
  @salary = Faker::Number.number
  @age = Faker::Number.number(digits: 2)
  @assert = Assertions.new
end

  Quando('ele enviar as informações do funcionário') do
    @create_employee = @create.create_employee(@name, @salary, @age)
    puts @create_employee
  end

  Então('esse funcionário deve ser cadastrado') do
    @assert.request_success(@create_employee.code, @create_employee.msg)
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee["data"]["employee_name"]).to eql (@name)
    expect(@create_employee["data"]["employee_salary"]).to eql (@salary)
    expect(@create_employee["data"]["employee_age"]).to eql (@age)
  end

Dado('que o usuário deseje alterar alguma informação de um funcionário') do
  @request = Employee_Requests.new
  @assert = Assertions.new
end

  Quando('ele enviar as novas informações') do
    @update_employee = @request.update_employee(@request.find_employee['data'][0]['id'], 'Chico', 100, 40)

    puts @update_employee
  end

  Então('as informações serão alteradas') do
    @assert.request_success(@update_employee.code, @update_employee.msg)
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee["data"]["employee_name"]).to eql 'Toin de uvu'
    expect(@update_employee["data"]["employee_salary"]).to eql (81101)
    expect(@update_employee["data"]["employee_age"]).to eql (60)
  end

  Dado('que o usuário deseja deletar os dados de um funcionário') do
    @request = Employee_Requests.new
  end
  
    Quando('ele enviar a identificação única') do
      @delete_employee = @request.delete_employee(@request.find_employee['data'][0]['id'])
    end
    
    Então('esse funcionário será deletado do sistema') do
      puts @delete_employee.msg
      expect(@delete_employee.code).to eql (200)
      expect(@delete_employee.msg).to eql 'OK'
      expect(@delete_employee["status"]).to eql 'success'
      expect(@delete_employee["data"]).to eql '1'
      expect(@delete_employee["message"]).to eql 'Successfully! Record has been deleted'
    end