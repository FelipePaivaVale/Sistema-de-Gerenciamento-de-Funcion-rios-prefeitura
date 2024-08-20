json.extract! cargo, :id, :nome, :descricao, :departamento_id, :nivel, :salario_base, :requisitos, :beneficios, :status, :created_at, :updated_at
json.url cargo_url(cargo, format: :json)
