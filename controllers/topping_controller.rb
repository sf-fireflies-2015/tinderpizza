

get '/pizzas/:pizza_id/toppings' do
  @pizza = Pizza.find(params[:pizza_id])
  @toppings = @pizza.toppings
  erb :'toppings/index'
end


get '/pizzas/:pizza_id/toppings/new' do
  @pizza = Pizza.find(params[:pizza_id])
  @topping = @pizza.toppings.new
  erb :'toppings/new'
end


get '/pizzas/:pizza_id/toppings/:id' do
  @pizza = Pizza.find(params[:pizza_id])
  @topping = @pizza.toppings.find(params[:id])
  erb :'toppings/show'
end

get '/pizzas/:pizza_id/toppings/:id/edit' do
  @pizza = Pizza.find(params[:pizza_id])
  @topping = @pizza.toppings.find(params[:id])
  erb :'toppings/edit'
end

post '/pizzas/:pizza_id/toppings/:id' do
  @pizza = Pizza.find(params[:pizza_id])
  @topping = @pizza.toppings.find(params[:id])

  # Using params helper
  @topping.assign_attributes(params_whitelist [:name, :calories])

  if @topping.save
    redirect "/pizzas/#{@pizza.id}/toppings/#{@topping.id}"
  else
    erb :'toppings/edit'
  end  
end

post '/pizzas/:pizza_id/toppings' do
  @pizza = Pizza.find(params[:pizza_id])
  @topping = @pizza.toppings.new

  # Using params helper
  @topping.assign_attributes(params_whitelist [:name, :calories])

  if @topping.save
    flash[:message] = 'Topping Added'
    redirect "/pizzas/#{@pizza.id}"
  else
    erb :'toppings/new'
  end  
end

post '/pizzas/:pizza_id/toppings/:id/delete' do
  @pizza = Pizza.find(params[:pizza_id])
  @topping = @pizza.toppings.find(params[:id])
  flash[:message] = "#{@topping.name} removed"
  @topping.destroy
  redirect "/pizzas/#{@pizza.id}"
end

