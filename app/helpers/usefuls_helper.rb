module UsefulsHelper
  def link_to_useful reference
    if user_signed_in?
      if Useful.exists?(reference_id: reference.id, user_id: current_user.id)
        u = Useful.find_by_reference_id_and_user_id(reference.id, current_user.id)
        link_to "Unuseful", problem_reference_useful_path(reference.problem, reference, u), method: :delete, class: "btn"
      else
        link_to "Useful", problem_reference_usefuls_path(reference.problem, reference), method: :post, class: "btn"
      end
    else
      "disabled useful button"
    end
  end
end
