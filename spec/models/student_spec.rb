require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "instance" do
    before(:all) {
      @valid_student = Student.new(gender: 'Male', citizenship: 'US Citizen', address: '123 Sesame Street');
      @invalid_student = Student.new
      @missing_one_student = Student.new(gender: 'Male')
    }
    it "when valid student instantiated" do
      expect(@valid_student).to be_valid
    end
    it 'when invalid student instantiated' do
      expect(@invalid_student).to_not be_valid
    end
    it "has one of the attributes missing" do
      expect(@missing_one_student).to_not be_valid
    end
  end
end