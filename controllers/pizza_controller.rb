

get '/pizzas' do
  @pizzas = Pizza.all
  erb :'pizzas/index'
end


get '/pizzas/new' do
  @pizza = Pizza.new
  erb :'pizzas/new'
end


get '/pizzas/:id' do
  id = params[:id]
  @pizza = Pizza.find(id)
  erb :'pizzas/show'
end

get '/pizzas/:id/edit' do
  id = params[:id]
  @pizza = Pizza.find(id)
  erb :'pizzas/edit'
end

post '/pizzas/:id' do
  id = params[:id]
  @pizza = Pizza.find(id)

  @pizza.name = params[:name]
  @pizza.price_cents = params[:price_cents]
  @pizza.diameter_inches = params[:diameter_inches]

  if @pizza.save
    redirect "/pizzas/#{@pizza.id}"
  else
    erb :'pizzas/edit'
  end  
end

post '/pizzas' do
  @pizza = Pizza.new

  @pizza.name = params[:name]
  @pizza.price_cents = params[:price_cents]
  @pizza.diameter_inches = params[:diameter_inches]

  if @pizza.save
    redirect "/pizzas/#{@pizza.id}"
  else
    erb :'pizzas/new'
  end  
end

post '/pizzas/:id/delete' do
  id = params[:id]
  @pizza = Pizza.find(id)
  @pizza.destroy
  redirect "/pizzas"
end


