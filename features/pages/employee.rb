Dado('que o usuário consulte informações de funcionário') do
  @get_url = 'http://dummy.restapiexample.com/api/v1/employees'
end

  Quando('ele realizar a pesquisa') do
    @list_employee = HTTParty.get(@get_url)
  end

  Então('uma lista de Funcionarios deve retornar') do
    expect(@list_employee.code).to eql 200
    expect(@list_employee.message).to eql 'OK'
  end

Dado('que o usuário deseja inserir um novo funcionário') do
  @post_url = 'http://dummy.restapiexample.com/api/v1/create'
end

  Quando('ele enviar as informações do funcionário') do
    @create_employee = HTTParty.post(@post_url, :headers => {'Content-Type': 'application/json'}, body: {
      "employee_name": "Ze de Quinca",
      "employee_salary": 21101,
      "employee_age": 64,
      "profile_image": ""
    }.to_json)

    puts @create_employee
  end

  Então('esse funcionário deve ser cadastrado') do
    expect(@create_employee.code).to eql (200)
    expect(@create_employee.msg).to eql 'OK'
    expect(@create_employee["status"]).to eql 'success'
    expect(@create_employee["message"]).to eql 'Successfully! Record has been added.'
    expect(@create_employee["data"]["employee_name"]).to eql 'Ze de Quinca'
    expect(@create_employee["data"]["employee_salary"]).to eql (21101)
    expect(@create_employee["data"]["employee_age"]).to eql (64)
  end

Dado('que o usuário deseje alterar alguma informação de um funcionário') do
  @get_employee = HTTParty.get('http://dummy.restapiexample.com/api/v1/employees', :headers => {'Content-Type': 'application/json'})
  employee_id = @get_employee['data'][0]['id']
  @put_url = 'http://dummy.restapiexample.com/api/v1/update/' + employee_id.to_s
end

  Quando('ele enviar as novas informações') do
    @update_employee = HTTParty.put(@put_url, :headers => {'Content-Type': 'application/json'}, body: {
      "employee_name": "Toin de uvu",
      "employee_salary": 81101,
      "employee_age": 60,
      "profile_image": ""
    }.to_json)

    puts @update_employee
  end

  Então('as informações serão alteradas') do
    expect(@update_employee.code).to eql (200)
    expect(@update_employee.msg).to eql 'OK'
    expect(@update_employee["status"]).to eql 'success'
    expect(@update_employee["message"]).to eql 'Successfully! Record has been updated.'
    expect(@update_employee["data"]["employee_name"]).to eql 'Toin de uvu'
    expect(@update_employee["data"]["employee_salary"]).to eql (81101)
    expect(@update_employee["data"]["employee_age"]).to eql (60)
  end