require 'rails_helper'

RSpec.describe Degree, type: :model do
  describe "instance" do
    before(:all) {
      @valid_degree = Degree.new(name: 'UofI', city: 'Iowa City', major: "BME", degree_type: 'Bachelors of Science', gpa: '4.0');
      @invalid_degree = Degree.new
      @missing_one_degree = Degree.new(name: 'UofI', city: 'Iowa City', major: "BME", degree_type: 'Bachelors of Science')
    }
    describe "when valid degree instantiated" do
      subject {@valid_degree}
      it {should be_valid}
    end
    describe 'when invalid degree instantiated' do
      subject {@invalid_degree}
      it {should_not be_valid}
    end
    describe "has one of the attributes missing" do
      subject {@missing_one_degree}
      it {should_not be_valid}
    end
  end
end
