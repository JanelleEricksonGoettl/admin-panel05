class StudentsController < ApplicationController
  before_action :find_student, only: %i[show edit update]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      msg = "New student created."
      flash.now[:success] = msg
      redirect_to students_path(@student)
    else
      msg = @student.errors.full_messages
      flash.now[:error] = msg
      render 'new'
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
      msg = "Student edited."
      flash.now[:success] = msg
      redirect_to students_path
    else
      msg = @student.errors.full_messages
      flash.now[:error] = msg
      render 'edit'
    end
  end

  def show
    # @cohort = Cohort.find(params[:id])
    # @student = Student.new
  end

  def destroy
    @student = Student.find(params[:student_id])
    @student.destroy
    respond_to do |format|
      format.js
      format.html { p 'html_response'; redirect_to root_path }
    end
  end

  private

    def student_params
      params.require(:student).permit(:first_name, :last_name, :age, :education, :cohort_id)
    end

    def find_student
      @student = Student.find(params[:id])
    end
end
