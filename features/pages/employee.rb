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