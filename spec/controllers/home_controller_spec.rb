describe "Home Controller" do

  describe "GET /" do

    it 'should be ok' do
      get '/'
      expect(last_response).to be_ok
    end

    context 'with Pepperoni Pizza' do
      let!(:pizza) do
         Pizza.find_or_create_by!(
           name: 'Pepperoni',
           price_cents: 999,
           diameter_inches: 12
         )
      end
      
      it 'responds with top pizzas' do
        get '/'
        expect(last_response.body).to include(pizza.name)
      end
    end
  end  

end