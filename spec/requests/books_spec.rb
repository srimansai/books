require"rails_helper"

RSpec.describe "Books API", :type => :request do
  describe 'GET /books' do
   it "returns all books" do
     FactoryBot.create(:book, title: '1984', author: 'gearge orwell')
     FactoryBot.create(:book, title: 'the time machine', author: 'h.g wells') 
   
      get "/api/v1/books"
   
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(2)
    end 
  end

  describe 'POST /books' do
    it 'create a new book' do
      post "/api/v1/books", params: { book: {title: 'the martian', author: 'andy weir'} }
      
      expect(response).to have_http_status(:created)
      
    end
  end
end
  
 
