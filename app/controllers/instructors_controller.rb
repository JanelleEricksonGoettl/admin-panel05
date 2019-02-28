class InstructorsController < ApplicationController
  # before_action :find_cohort, only: %i[show edit update]
  before_action :find_instructor, only: %i[show edit update]

  def index
    @instructors = Instructor.all
  end

  def new
    @instructor = Instructor.new
  end

  def create
    @instructor = Instructor.new(instructor_params)
    if @instructor.save
      msg = "New instructor created."
      flash.now[:success] = msg
      redirect_to instructors_path(@instructor)
    else
      msg = @instructor.errors.full_messages
      flash.now[:error] = msg
      render 'new'
    end
  end

  def edit
  end

  def update
    if @instructor.update(instructor_params)
      msg = "Instructor edited."
      flash.now[:success] = msg
      redirect_to instructors_path
    else
      msg = @instructor.errors.full_messages
      flash.now[:error] = msg
      render 'edit'
    end
  end

  def show
    # @cohort = Cohort.find(params[:id])
    # @instructor = Instructor.new
    
  end

  def destroy
    @instructor = Instructor.find(params[:instructor_id])
    @instructor.destroy
    respond_to do |format|
      format.js
      format.html { p 'html_response'; redirect_to root_path }
    end
  end

  private

    def instructor_params
      params.require(:instructor).permit(:first_name, :last_name, :age, :education, :salary, :cohort_id)
    end
    
    def find_instructor
      @instructor = Instructor.find(params[:id])
    end

    # def find_cohort
    #   @cohort = @instructor.cohort
    # end
end
