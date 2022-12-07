require 'spec_helper'
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

describe StudentsController do
  describe 'degree creation' do
    before(:each) do
      @user = User.new(email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith');
      @student = Student.new(gender: 'Male', citizenship: 'US Citizen', address: '123 Sesame Street');
      @user.student= @student
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end
    it 'should create a degree' do
      post :degree_creation, {:degree =>  {name: 'UofI', city: 'Iowa City', major: "BME", degree_type: 'Bachelors of Science', gpa: '4.0'}}

      expect(Degree).to receive(:new).with(name: 'UofI', city: 'Iowa City', major: "BME", degree_type: 'Bachelors of Science', gpa: '4.0')
    end
    it 'should link that degree to current user signed in' do
      pending
    end
    it 'should redirect to the degree path on a successful creation' do
      allow(Degree).to receive(:new).with(name: 'UofI', city: 'Iowa City', major: "BME", degree_type: 'Bachelors of Science', gpa: '4.0')
      post :degree_creation, {}
      expect(response).to redirect_to '/students/degree'
    end
    it 'should flash errors if there any on fail' do
      fake_results = []
      allow(Degree).to receive(:new).and_return(fake_results)
      post :degree_creation, {}
      expect(response).to redirect_to '/students/degree'
      expect(flash[:notice]).to eq 'Must be filled'
    end
  end
  describe "update student" do
    it 'should update student with info given' do
      pending
    end
    it 'should redirect to users path on update' do
      pending
    end
    it 'should stay on users edit path on fail' do
      pending
    end
    it 'should flash errors on fail' do
      pending
    end
  end
end
