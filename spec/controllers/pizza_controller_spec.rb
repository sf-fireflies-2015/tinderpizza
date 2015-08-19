describe "Pizza Controller" do

  describe "GET /pizzas" do

    it 'should be ok' do
      get '/pizzas'
      expect(last_response).to be_ok
    end

    it 'responds with all pizzas' do
      pizza = Pizza.find_or_create_by!(
           name: 'CheesyCheese',
           price_cents: 999,
           diameter_inches: 12
         )      
      get '/pizzas'
      expect(last_response.body).to include(pizza.name)
    end

  end  

  describe "GET /pizzas/new" do

    it 'responds with a form that posts to /pizzas' do
      get '/pizzas/new'
      expect(last_response.body).to include('action="/pizzas"')
    end

  end

    # Use let clean up your specs
  let(:valid_pizza_attributes){ 
    { name: 'Peppery', diameter_inches: 12, price_cents: 999 }
  }

  let(:invalid_pizza_attributes){ 
    { name: nil, diameter_inches: 12, price_cents: 999 }
  }

  describe "POST /pizzas" do
  
    it 'should be ok' do
      post '/pizzas'
      expect(last_response).to be_ok
    end

    it 'should add a pizza with valid attributes' do
      # Use Expect with a Block for change expecations
      expect { 
        post '/pizzas', valid_pizza_attributes
      }.to change { 
        Pizza.count 
      }.by(1)
    end
  
    it 'should NOT add a pizza with invalid attributes' do
      # Use Expect with a Block for change expecations
      expect { 
        post '/pizzas', invalid_pizza_attributes
      }.to_not change { 
        Pizza.count 
      }
    end
  
  end

  describe "POST /pizzas/:id" do

    it 'should update the pizza with valid attributes' do
      # Pretend that use changed the name field to a valid value
      good_update = valid_pizza_attributes.dup
      good_update[:name] = "New Pizza Name"

      pizza = Pizza.create(valid_pizza_attributes)

      expect { 
        post "/pizzas/#{pizza.id}", good_update
      }.to change { 
        Pizza.find(pizza.id).name
      }.from(valid_pizza_attributes[:name]).to(good_update[:name])
    end
  
    it 'should NOT update the pizza with invalid attributes' do
      # Pretend that use changed the name field to a invalid value
      bad_update = valid_pizza_attributes.dup
      bad_update[:name] = ""

      pizza = Pizza.create(valid_pizza_attributes)

      expect { 
        post "/pizzas/#{pizza.id}", bad_update
      }.to_not change { 
        Pizza.find(pizza.id).name
      }
    end
  
  end

end
