class DegreesController < ApplicationController
  def degree_params
    params.require(:degree).permit(:name,:city,:degree_type,:major,:gpa)
  end

  def edit
    @degree = current_user.student.degrees.find(params[:id])
  end

  def update
    info = degree_params
    @degree = current_user.student.degrees.find(params[:id])
    @degree.update(:name => info[:name], :city => info[:city], :degree_type => info[:degree_type], :major => info[:major], :gpa => info[:gpa])
    if @degree.valid?
      redirect_to students_edit_path
    else
      flash[:info] = info
      flash[:errors] = @degree.errors
      redirect_to degrees_edit_path+"/"+params[:id].to_s
    end
  end
end
