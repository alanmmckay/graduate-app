require 'rails_helper'

RSpec.describe Degree, type: :model do
  describe "instance" do
    before(:all) {
      @valid_degree = Degree.new(name: 'UofI', city: 'Iowa City', major: "BME", degree_type: 'Bachelors of Science', gpa: '4.0');
      @invalid_degree = Degree.new
      @missing_one_degree = Degree.new(name: 'UofI', city: 'Iowa City', major: "BME", degree_type: 'Bachelors of Science')
    }
    it "when valid degree instantiated" do
      expect(@valid_degree).to be_valid
    end
    it 'when invalid degree instantiated' do
      expect(@invalid_degree).to_not be_valid
    end
    it "has one of the attributes missing" do
      expect(@missing_one_degree).to_not be_valid
    end
  end
end
