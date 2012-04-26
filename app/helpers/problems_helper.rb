module ProblemsHelper
  def link_to_watch problem
    if user_signed_in?
      if Watch.exists?(problem_id: problem.id, user_id: current_user.id)
        w = Watch.find_by_problem_id_and_user_id(problem.id, current_user.id)
        link_to "Unwatch", problem_watch_path(problem, w), method: :delete, class: "btn"
      else
        link_to "Watch", problem_watches_path(problem), method: :post, class: "btn"
      end
    else
      "disabled watch button"
    end
  end
end
