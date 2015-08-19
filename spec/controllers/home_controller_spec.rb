describe "Home Controller" do

  describe "/" do
    it 'should be ok' do
      get '/'
      expect(last_response).to be_ok
    end
  end  

end