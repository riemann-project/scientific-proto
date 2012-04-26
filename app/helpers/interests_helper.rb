module InterestsHelper
  def link_to_interest discussion
    if user_signed_in?
      if Interest.exists?(discussion_id: discussion.id, user_id: current_user.id)
        i = Interest.find_by_discussion_id_and_user_id(discussion.id, current_user.id)
        link_to "Uninteresting", problem_answer_discussion_interest_path(
        discussion.problem, discussion.super_answer, discussion, i),
        method: :delete, class: "btn"
      else
        link_to "Interesting", problem_answer_discussion_interests_path(
        discussion.problem, discussion.super_answer, discussion),
        method: :post, class: "btn"
      end
    else
      "disabled watch button"
    end
  end
end
