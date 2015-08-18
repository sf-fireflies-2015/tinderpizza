

get '/pizzas' do
  @pizzas = Pizza.all
  erb :'pizzas/index'
end

get '/pizzas/:id' do
  id = params[:id]
  @pizza = Pizza.find(id)
  erb :'pizzas/show'
end



