class Admin::TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find params[:id]
  end

  def update
    @test = Test.find params[:id]
    if @test.update_attributes tests_params
      flash[:info] = "Update check sheet!"
      render :show
    else
      flash[:danger] = "Can't update check sheet!"
      redirect_to admin_tests_path
    end
  end

  private
  def tests_params
    params.require(:test).permit :id, answers_attributes: [:id, :correct]
  end
end