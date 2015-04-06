require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
    
    
    let(:user) do
      user = User.new
      user.email = "maryam@gmail.com"
      user.encrypted_password = "1234"
      user.save validate: false
      user
    end
  
   
   describe "GET index" do
    it "assigns @categories" do
      
      category = Category.create!(:name => 'Education' )   
      get :index
      expect(assigns(:categories )).to eq([category])
    end
    
    
    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
    
end

 
 describe "GET show" do
 
  
  it "renders the #show view" do
    category = Category.create!(:name => 'Education' )  
    get :show, id: category.id
    expect(response).to render_template("show")
   
  end
  
end

  describe "GET new" do
   it 'assigns a new category to @category' do
    get :new
    expect(assigns(:category)).to be_a_new(Category)

  end
  
 end
 
 
 it "should create category" do
     user
     sign_in(user)
     post :create, category: {
      :name => "Education",
      }
    expect(Category.exists?(name: "Education")).to eq(true)
 
  end
  
  it "deletes the category" do
   category = Category.create!(:name => 'Education' )
    expect{
      delete :destroy, id: category.id        
    }.to change(Category,:count).by(-1)
  end
  
  
  
  
  
   
end
    
    
    
    


