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
    if @test.ready?
      @test.start_time = Time.zone.now
      @test.status = "Submitted"
      @test.save
      @count_down_time = @test.lesson.time * 60
    else
      @count_down_time = @test.lesson.time * 60 - (Time.zone.now - @test.start_time).to_i
    end
  end

  def update
    @test = Test.find params[:id]
    if @test.update_attributes test_params
      flash[:info] = "Update answer sheet!"
      @count_down_time = 0
      render :show
    else
      flash[:danger] = "Can't update answer sheet!"
      redirect_to tests_path
    end
  end

  private
  def test_params
    params.require(:test).permit :id, :lesson_id, :user_id, :status,
      answers_attributes: [:id, :option_id]
  end
end