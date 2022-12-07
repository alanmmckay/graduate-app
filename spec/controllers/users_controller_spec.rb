require 'rails_helper'

if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.6.0')
  if Gem::Version.new(Rails.version) < Gem::Version.new('5.0.0')
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new('2.7.0')
          @mon_data = nil
          @mon_data_owner_object_id = nil
        else
          @mon_mutex = nil
          @mon_mutex_owner_object_id = nil
        end
        initialize
      end
    end
  else
    $stderr.puts "Monkeypatch for ActionController::TestResponse is no longer needed"
  end
end

RSpec.describe UsersController, type: :controller do
  describe 'new' do
    it 'should have a successful response' do
      get :new
      expect(response).to be_successful
    end
    it 'should render the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  describe "update" do
    before(:each) do
      @user = User.new(email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it 'should redirect to users path if the update is successful' do
      post :update, {:user => {lname: 'George', fname: 'Smith'}}
      expect(response).to redirect_to('/users')
    end
    it 'should stay on the edit path if not successful' do
      @user = User.new(email: 'emailexample.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      post :update, {:user => {lname: 'George', fname: 'Smith'}}
      expect(response).to redirect_to('/users/edit')
    end
    it 'should flash errors if not a valid user' do
      @user = User.new(email: 'emailexample.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      post :update, {:user => {lname: 'George', fname: 'Smith'}}
      expect(flash[:errors]).to have_attributes(:messages => {:email=>["Invalid email given"]})
    end
  end
  describe "edit" do
    it 'should redirect to students edit path if the current user is a student' do
      @user = User.new(email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith')
      @student = Student.new(gender: 'Male', citizenship: 'US Citizen', address: '123 Sesame Street')
      @user.student= @student
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      post :edit
      expect(response).to redirect_to('/students/edit')
    end
  end
  describe "create" do
    it 'should redirect to user page if a user is created' do
      post :create, {:user => {email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith'}}
      expect(response).to redirect_to '/users'
    end
    it 'should stay on new user "redirect" page if not a valid user ' do
      post :create, {:user => {email: 'emailexample.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith'}}
      expect(response).to redirect_to '/users/new'
    end
    it 'should flash correct message if a user is created' do
      post :create, {:user => {email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith'}}
      expect(response).to redirect_to '/users'
      expect(flash[:login]).to eq 'Account has been created. Please sign in:'
    end
    it 'should flash errors if a user is not created' do
      post :create, {:user => {email: 'emailexample.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith'}}
      expect(response).to redirect_to '/users/new'
      expect(flash[:login]).to have_attributes(:messages => {:email=>["Invalid email given"]})
    end
  end
  describe "landing" do
    it 'should redirect to users homepage if logged in' do
      @user = User.new(email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      post :landing
      expect(response).to redirect_to('/users/show')
    end
    it 'should redirect to login page if not logged in' do
      post :landing
      expect(response).to have_http_status(:success)
    end
  end
  describe "login" do
    before(:each) do
      @user = User.new(email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it 'should flash if the user is not registered' do
      post :login, {:user => {email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith'}}
      expect(flash[:login]).to eq('Invalid Credentials')
    end
    it 'should redirect to users show path' do
      post :login, {:user => {email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith'}}
      expect(response).to redirect_to('/users/show')
    end
  end
  describe "destroy" do
    before(:each) do
      @user = User.new(email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith')
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it 'should redirect to the login page' do
      post :destroy, {:user => {email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith'}}
      expect(response).to redirect_to('/users/login')
    end
  end

end

