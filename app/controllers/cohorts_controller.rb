class CohortsController < ApplicationController
  before_action :find_cohort, only: %i[show edit update]

  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def create
    @cohort = Cohort.new(cohort_params)
    # @cohort.save
    if @cohort.save
      msg = "New cohort created."
      flash.now[:success] = msg
      redirect_to cohort_path(@cohort)
    else
      msg = @cohort.errors.full_messages
      flash.now[:error] = msg
      render 'new'
    end
  end

  def edit
  end

  def update
    if @cohort.update(cohort_params)
      msg = "Cohort edited."
      flash.now[:success] = msg
      redirect_to @cohort
    else
      msg = @cohort.errors.full_messages
      flash.now[:error] = msg
      render 'edit'
    end
  end

  def show
    @cohort = Cohort.find(params[:id])
    @instructor = Instructor.new
  end

  def destroy
    @cohort = Cohort.find(params[:cohort_id])
    @cohort.destroy
    respond_to do |format|
      format.js
      format.html { p 'html_response'; redirect_to root_path }
    end
  end

  private

    def cohort_params
      params.require(:cohort).permit(:name, :start_date, :end_date, :course_id)
    end

    def find_cohort
      @cohort = Cohort.find(params[:id])
    end

end
