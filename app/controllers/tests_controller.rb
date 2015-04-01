class TestsController < ApplicationController
  def index
    @test = Test.new
    @tests = current_user.tests
  end

  def create
    test = Test.new test_params
    if test.save
      flash[:success] = "You created a test!"
      redirect_to tests_path
    else
      flash[:danger] = "Not complete creating test!"
      redirect_to tests_path
    end
  end

  def show
    @test = Test.find params[:id]
    @answers = @test.answers
  end

  private
  def test_params
    params.require(:test).permit :id, :lesson_id, :user_id, :status
  end
end