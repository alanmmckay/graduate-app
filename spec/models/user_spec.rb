require 'rails_helper'

def generate_user(missing = nil) #This could probably be abstracted
  attributes = {:email => 'email@example.com', :password => 'test_password', password_confirmation: 'test_password', lname: 'Smith', fname: 'Frank' }
  new_user = User.new
  attributes.each do |attribute|
    key = attribute[0]
    value = attribute[1]
    if key != missing
      method = (key.to_s + "=").to_sym
      new_user.send(method, value)
    end
  end
  new_user
end

RSpec.describe User, type: :model do
  describe 'instance' do
    before(:all) {
      @valid_user = User.new(email: 'email@example.com', password: 'test_password', password_confirmation: 'test_password', lname: 'Frank', fname: 'Smith');
      @invalid_user = User.new
    }
    describe 'when valid user instantiated' do
      subject { @valid_user }
      it { should be_valid}
    end
    describe 'when invalid user instantiated' do
      subject { @invalid_user }
      it { should_not be_valid}
    end
    describe 'when valid user is instantiated using generate_user' do
      subject { generate_user }
      it {should be_valid}
    end
    describe 'when invalid attributes are given' do
      it 'has one single of the following attributes missing' do
        attributes = [:email,:password, :password_confirmation, :lname, :fname]
        attributes.each do |attribute|
          expect(generate_user( attribute )).to_not be_valid
        end
      end
      valid_user = generate_user
      invalid_user = valid_user
      it 'has an invalid email without a domain' do
        invalid_user.email = "testdotcom"
        expect(invalid_user).to_not be_valid
      end
      it 'has an invalid email without a top-level domain' do
        invalid_user.email = "test.example"
        expect(invalid_user).to_not be_valid
      end
      #to expand upon email tests:
      #https://accelatest.com/how-to-write-email-validation-test-cases/
      it 'has an invalid phone number' do
        pending
      end
      it 'has an invalid address' do
        pending
      end
    end
    describe 'when valid attributes are given' do
      valid_user = generate_user
      it 'should return a valid name from fname and lname' do
        expect(valid_user.name).to eql('Frank Smith')
      end
    end
  end
end

