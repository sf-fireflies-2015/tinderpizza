

get '/pizzas' do
  @pizzas = Pizza.all
  erb :'pizzas/index'
end


get '/pizzas/new' do
  @pizza = Pizza.new
  if request.xhr?
    erb :'pizzas/_form', :layout => false, :locals => {:pizza => @pizza }
  else
    erb :'pizzas/new'
  end
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

  # Using params helper
  @pizza.assign_attributes(params_whitelist [:name, :price_cents, :diameter_inches])

  if @pizza.save
    flash[:message] = 'Pizza Saved!'
    redirect "/pizzas/#{@pizza.id}"
  else
    erb :'pizzas/edit'
  end  
end

post '/pizzas' do
  @pizza = Pizza.new
  # Using params helper
  @pizza.assign_attributes(params_whitelist [:name, :price_cents, :diameter_inches])

  if @pizza.save

    if request.xhr?
      erb :'pizzas/_item', :layout => false, :locals => {:pizza => @pizza }
    else
      flash[:message] = 'Pizza Added!'
      redirect "/pizzas/#{@pizza.id}"
    end
  else
    if request.xhr?
      halt 400, erb(:'pizzas/_form', :layout => false, :locals => {:pizza => @pizza })
    else
      erb :'pizzas/new'
    end
  end  
end

post '/pizzas/:id/delete' do
  id = params[:id]
  @pizza = Pizza.find(id)
  flash[:message]= "#{@pizza.name} Deleted!"
  @pizza.destroy
  redirect "/pizzas"
end


