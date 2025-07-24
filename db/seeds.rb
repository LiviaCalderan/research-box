3.times do
  Search.create(user_search: "Teste de busca", user_ip: "10.0.0.1")
end

Search.create(user_search: "Outra busca", user_ip: "10.0.0.1")
Search.create(user_search: "Outra busca", user_ip: "10.0.0.2")

5.times do
  Search.create(user_search: "Outra busca", user_ip: "10.0.0.1")
end
