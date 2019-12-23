class CoursesController < ApplicationController
  def index
    @courses =Course.all
  end

  def new
    @course =Course.new
  end

  def create
    @course=Course.create(params.require(:course).permit(:name,:couse_code,:course_description,:credit_hour,:ects))
    if @course.valid?
      redirect_to courses_index_path
    else
      flash[:errors]= @course.errors.full_messages
      redirect_to courses_new_path
    end
  end

  def show
    @course=Course.find(params[:id])
  end

  def edit
    @course=Course.find(params[:id])
  end

  def update
    @course=Course.find(params.require(:course).permit(:id)[:id])
    @course.update(params.require(:course).permit(:name,:couse_code,:course_description,:credit_hour,:ects))
  end

  def destroy
    @course=Course.find(params[:id])
    @course.destroy
    @enrolled=Enrollment.find_by({"course_id":id})
    @enrolled.destory
    redirect_to courses_index_path
  end
end
