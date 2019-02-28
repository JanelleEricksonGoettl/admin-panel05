class CoursesController < ApplicationController
  before_action :find_course, only: %i[show edit update]


  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      msg = "New course created."
      flash.now[:success] = msg
      redirect_to courses_path
    else
      msg = @course.errors.full_messages
      flash.now[:error] = msg
      render 'new'
    end
  end

  def edit
  end

  def update
    if @course.update
      msg = "Course edited."
      flash.now[:success] = msg
      redirect_back(fallback_location: courses_path)
    else
      msg = @course.errors.full_messages
      flash.now[:error] = msg
      render 'edit'
    end
  end

  def show
    @course = Course.find(params[:id])
    @cohort = Cohort.new
  end

  def destroy
    @course = Course.find(params[:course_id])
    @course.destroy
    respond_to do |format|
      format.js
      format.html { p 'html_response'; redirect_to root_path }
    end
  end


  private
    def course_params
      params.require(:course).permit(:name, :hours)
    end

    def find_course
      @course = Course.find(params[:id])
    end
end
