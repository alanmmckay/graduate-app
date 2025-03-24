require 'spec_helper'
require 'rails_helper'

describe GradApplication do
  describe "instance" do
    before(:all) {
      @valid_grad_application = GradApplication.new(university: 'Test', date: '12/01/2022', first_name: 'Test', last_name: 'Test', citizenship: 'US Citizen', gender: 'Male',
                                                    research_area: 'TestArea', deg_obj: 'Masters', deg_obj_major: 'TestMajor', ug_inst: 'Test', ug_inst_city: 'Test',
                                                    ug_gpa: '4.0', ug_deg_earned: 'TestDegree', recommender_1: 'test', recommendation_1_email: 'test@test.com');
      @invalid_grad_application= GradApplication.new
      @missing_one_grad_application = GradApplication.new(university: 'Test', date: '12/01/2022', first_name: 'Test', last_name: 'Test', citizenship: 'US Citizen', gender: 'Male',
                                                          research_area: 'TestArea', deg_obj: 'Masters', deg_obj_major: 'TestMajor', ug_inst: 'Test', ug_inst_city: 'Test',
                                                          ug_gpa: '4.0', ug_deg_earned: 'TestDegree');
    }
    it "when valid grad application instantiated" do
      expect(@valid_grad_application).to be_valid
    end
    it 'when invalid grad application instantiated' do
      expect(@invalid_grad_application).to_not be_valid
    end
    it "has one of the attributes missing" do
      expect(@missing_one_grad_application).to_not be_valid
    end
    it 'has an invalid email without a domain' do
      @valid_grad_application.recommendation_1_email = "testdotcom"
      expect(@invalid_grad_application).to_not be_valid
    end
    it 'has an invalid email without a top-level domain' do
      @valid_grad_application.recommendation_1_email = "test.example"
      expect(@invalid_grad_application).to_not be_valid
    end
  end
end
