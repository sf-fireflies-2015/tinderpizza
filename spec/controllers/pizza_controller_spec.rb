describe "Pizza Controller" do

  describe "/pizzas" do
    it 'should be ok' do
      get '/pizzas'
      expect(last_response).to be_ok
    end

    it 'responds with top pizzas' do
    end
  end  


  

end