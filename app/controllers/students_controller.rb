class StudentsController < ApplicationController
  def index
    @students =Student.all

  end

  def new
    @student=Student.new
  end

  def create
    @student=Student.create(params.require(:student).permit(:full_name,:id_num,:sex,:department,:compus,:dob))
    if @student.valid?
      redirect_to students_index_path
    else
      flash[:errors]= @student.errors.full_messages
      redirect_to students_new_path
    end
  end

  def show
    @student=Student.find(params[:id])
  end

  def edit
    @student=Student.find(params[:id])
  end

  def update
    @student=Student.find(params.require(:student).permit(:id)[:id])
    @student.update(params.require(:student).permit(:full_name,:id_num,:sex,:department,:compus,:dob))
  end

  def destroy
    @student=Student.find(params[:id])
    @student.destroy
    @enrolled=Enrollment.find_by({"student_id":id})
    @enrolled.destory
    redirect_to students_index_path
  end

end
