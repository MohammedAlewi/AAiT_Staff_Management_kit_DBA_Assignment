class EnrollmentsController < ApplicationController
    def index
      @enrollments=Enrollment.all
      
      @st=[]
      for key in @enrollments do
          @st.push([Student.find(key.student_id),Course.find(key.course_id)])
      end
    end

    def new
      @enrollment=Enrollment.new
    end

    def create
      @enrollment=Enrollment.create(params.require(:enrollment).permit(:course_id,:student_id))
      @added=@enrollment.course.name
      redirect_to enrollments_index_path(@added)
    end

    def destroy
      @enrollment= Enrollment.find(params[:id])
      @student=@enrollment.student
      @enrollment.destroy
      redirect_to students_show_path({"id"=>@student.id})
    end
end
