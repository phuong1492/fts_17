class Admin::LessonsController < ApplicationController
  def index
    
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:info] = "Created new lesson: #{@lesson.name}"
      redirect_to admin_lessons_path
    else
      render :new
    end
  end

  private
  def lesson_params
    params.require(:lesson).permit :name, :time,
      questions_attributes: [:content, options_attributes: [:content, :correct, :_destroy]]
  end
end