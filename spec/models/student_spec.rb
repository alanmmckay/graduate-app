require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "instance" do
    before(:all) {
      @valid_student = Student.new(gender: 'Male', citizenship: 'US Citizen', address: '123 Sesame Street');
      @invalid_student = Student.new
      @missing_one_student = Student.new(gender: 'Male')
    }
    describe "when valid student instantiated" do
      subject {@valid_student}
      it {should be_valid}
    end
    describe 'when invalid student instantiated' do
      subject {@invalid_student}
      it {should_not be_valid}
    end
    describe "has one of the attributes missing" do
      subject {@missing_one_student}
      it {should_not be_valid}
    end
  end
end