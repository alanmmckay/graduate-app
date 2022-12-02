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
    it 'should create a degree' do
      expect(Degree).to receive(:new).with(name: 'UofI', city: 'Iowa City', major: "BME", degree_type: 'Bachelors of Science', gpa: '4.0')
      post :degree_creation, {:degree_params => {name: 'UofI', city: 'Iowa City', major: "BME", degree_type: 'Bachelors of Science', gpa: '4.0'}}
    end
    it 'should link that degree to current user signed in' do

    end
    it 'should redirect to the degree path' do

    end
    it 'should flash errors if there any' do

    end
  end
  describe "update student" do
    it 'should update student with info given' do

    end
    it 'should redirect to users path on update' do

    end
    it 'should stay on users edit path on fail' do

    end
    it 'should flash errors on fail' do

    end
  end
end
