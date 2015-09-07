before '/api/v1/*' do
  content_type :json
end

before '/api/v1/pizzas/:id' do
  id = params[:id]
  begin
    @pizza = Pizza.find(id)
  rescue ActiveRecord::RecordNotFound
    halt 404, {:message => 'Pizza Not Found'}.to_json
  end  
end

get '/api/v1/pizzas' do
  Pizza.all.to_json
end

get '/api/v1/pizzas/:id' do
  @pizza.to_json
end

put '/api/v1/pizzas/:id' do
  @pizza.assign_attributes(params_whitelist [:name, :price_cents, :diameter_inches])
  if @pizza.save
    @pizza.to_json
  else
    halt 403, @pizza.errors.to_json
  end  
end

post '/api/v1/pizzas' do
  pizza = Pizza.new
  pizza.assign_attributes(params_whitelist [:name, :price_cents, :diameter_inches])
  if pizza.save
    pizza.to_json
  else
    halt 403, pizza.errors.to_json
  end  
end

delete '/api/v1/pizzas/:id' do
  @pizza.destroy
  status 204
end


