class StudentsController < ApplicationController
  def index
    @students = Student.all
    #TODO: Change this to return only students in the logged in department
  end
end
