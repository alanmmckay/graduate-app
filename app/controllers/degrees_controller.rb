class DegreesController < ApplicationController
  def edit
    @degree = current_user.student.degrees.find(params[:id])
    puts @degree
  end

  def update
  end
end
