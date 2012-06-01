module AnswersHelper
  def sanitize_it text
  	raw Sanitize.clean(text, Sanitize::Config::RELAXED)
  end
end