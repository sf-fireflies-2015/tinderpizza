before '/api/v1/*' do
  content_type :json
end

get '/api/v1/pizzas' do
  Pizza.all.to_json
end


get '/api/v1/pizzas/:id' do
  Pizza.find(params[:id]).to_json
end

post '/api/v1/pizzas/:id' do
  pizza = Pizza.find(params[:id])
  pizza.assign_attributes(params_whitelist [:name, :price_cents, :diameter_inches])
  if pizza.save
    pizza.to_json
  else
    halt 400, pizza.errors.to_json
  end  
end

post '/api/v1/pizzas' do
  pizza = Pizza.new
  pizza.assign_attributes(params_whitelist [:name, :price_cents, :diameter_inches])
  if pizza.save
    status_code 201
    pizza.to_json
  else
    halt 400, pizza.errors.to_json
  end  
end

post '/api/v1/pizzas/:id/delete' do
  pizza = Pizza.find(params[:id])
  pizza.destroy
  status_code 202
end

