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
  describe "create" do
    it 'should redirect to user page if a user is created' do
      post :create, {:user => {email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith'}}
      expect(response).to redirect_to '/users'
    end
    it 'should stay on new user "redirect" page if not a valid user ' do
      post :create, {:user => {email: 'emailexample.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith'}}
      expect(response).to redirect_to '/users/new'
    end
  end
end

