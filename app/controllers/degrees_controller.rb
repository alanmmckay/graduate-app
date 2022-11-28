class DegreesController < ApplicationController
  def degree_params
    params.require(:degree).permit(:name,:city,:degree_type,:major,:gpa)
  end

  def edit
    @degree = current_user.student.degrees.find(params[:id])
  end

  def update
    info = degree_params
    update = current_user.student.degrees.find(params[:id]).update(:name => info[:name], :city => info[:city], :degree_type => info[:degree_type], :major => info[:major], :gpa => info[:gpa])
    redirect_to students_edit_path
    #current_user.save
  end
end
