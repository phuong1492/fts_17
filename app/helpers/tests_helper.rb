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
end