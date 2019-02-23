class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      msg
  end

  def edit
  end

  def show
  end

  private
    def course_params
      params.require(:course).permit(:name, :hours)
    end
end
