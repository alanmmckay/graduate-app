class DegreesController < ApplicationController
  def degree_params
    params.require(:degree).permit(:name,:city,:degree_type,:major,:gpa)
  end

  def edit
    @degree = current_user.degrees.find(params[:id])
  end

  def run_update(success_path,fail_path)
    info = degree_params
    @degree = current_user.degrees.find(params[:id])
    @degree.update(:name => info[:name], :city => info[:city], :degree_type => info[:degree_type], :major => info[:major], :gpa => info[:gpa])
    if @degree.valid?
      redirect_to success_path
    else
      flash[:info] = info
      flash[:errors] = @degree.errors
      redirect_to fail_path
    end
  end
  def update
    run_update(students_edit_path,degrees_edit_path+"/"+params[:id].to_s)
  end

  def application_update
    run_update(applications_new_path,degrees_application_update_path)
  end

  def application_edit
    redirect_to degrees_edit_path+"/"+params[:id].to_s
  end
end
