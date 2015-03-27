class Admin::LessonsController < ApplicationController
  def index
    @lessons = Lesson.paginate page: params[:page], per_page: 20
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new lesson_params
    if @lesson.save
      flash[:info] = "Created new lesson: #{@lesson.name}"
      redirect_to admin_lesson_path(@lesson)
    else
      render :new
    end
  end

  def edit
    @lesson = Lesson.find params[:id]
  end

  def update
    @lesson = Lesson.find params[:id]
    if @lesson.update(lesson_params)
      flash[:info] = "Updated lesson!"
      redirect_to admin_lesson_path(@lesson)
    else
      render :edit
    end
  end

  def show
    @lesson = Lesson.find params[:id]
    @questions = @lesson.questions
  end

  private
  def lesson_params
    params.require(:lesson).permit :name, :time,
      questions_attributes: [:content, :id, 
        options_attributes: [:content, :correct, :_destroy, :id]]
  end
end