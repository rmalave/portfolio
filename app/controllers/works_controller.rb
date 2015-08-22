class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.all
  end

  def show
  end

  def new
    @work = Work.new
  end

  def edit
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      redirect_to @work, notice: 'Work was successfully created.' 
      render :show, status: :created, location: @work 
    else
      render :new
    end

  end

  def update
    if @work.update(work_params)
      redirect_to @work, notice: 'Work was successfully updated.' 
    else
      render :edit 
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:title, :description)
    end
end
