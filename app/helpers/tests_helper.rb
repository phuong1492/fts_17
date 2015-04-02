module TestsHelper
  def get_word_of_link test
    if test.ready?
      "Start"
    elsif test.testing?
      "Continue"
    elsif test.completed?
      "View"
    end
  end

  def get_option_style answer, option, test
    if option.correct && test.completed?
      answer.correct ? "color:blue" : "color:red"
    else
      ""
    end  	
  end
end