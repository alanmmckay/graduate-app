require 'rails_helper'

def generate_user(missing = nil) #This could probably be abstracted
  attributes = {:email => 'email@example.com', :password => 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith' }
  invalid_user = User.new
  attributes.each do |attribute|
    key = attribute[0]
    value = attribute[1]
    if key != missing
      method = (key.to_s + "=").to_sym
      invalid_user.send(method, value)
    end
  end
  invalid_user
end

RSpec.describe User, type: :model do
  describe 'instance' do
    before(:all) {
      @valid_user = User.new(email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith');
      @invalid_user = User.new
    }
    describe 'when valid user is new' do
      subject { @valid_user }
      it { should be_valid}
    end
    describe 'when invalid user is new' do
      subject { @invalid_user }
      it { should_not be_valid}
    end
    describe 'when valid user is created using generate_user' do
      subject { generate_user }
      it {should be_valid}
    end
    describe 'when a single of the following attributes is missing' do
      attributes = [:email,:password, :password_confirmation, :lname, :fname]
      attributes.each do |attribute|
        subject { generate_user( attribute )}
        it {should_not be_valid}
      end
    end
    describe 'when an invalid email is supplied' do
      valid_user = generate_user
      invalid_user = valid_user
      invalid_user.email = "testdotcom"
      subject { invalid_user }
      it {should_not be_valid}
    end
  end
end

