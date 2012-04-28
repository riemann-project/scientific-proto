module UsefulsHelper
  def link_to_useful answer
    if user_signed_in?
      if Useful.exists?(answer_id: answer.id, user_id: current_user.id)
        u = Useful.find_by_answer_id_and_user_id(answer.id, current_user.id)
        link_to "Unuseful", problem_answer_useful_path(answer.problem, answer, u), method: :delete, class: "btn"
      else
        link_to "Useful", problem_answer_usefuls_path(answer.problem, answer), method: :post, class: "btn"
      end
    else
      "disabled useful button"
    end
  end
end
