

get '/pizzas' do
  @pizzas = Pizza.all
  erb :'pizzas/index'
end