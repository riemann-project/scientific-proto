module UsersHelper
  def link_to_follow_or_unfollow user
    if user_signed_in? and current_user.id != user.id
        if Follow.exists?(followed_id: user.id, user_id: current_user.id)
          follow = Follow.find_by_followed_id_and_user_id(user.id, current_user.id)
          link_to "Unfollow", user_follow_path(user.id, follow.id), method: :delete, class: "btn"
        else
          link_to "Follow", user_follows_path(user), method: :post, class: "btn"
        end
    else
      "disabled button"
    end
  end
  
  def avatar_tag user, option = ""
    if user.avatar_url == nil
      image_tag "default_icon"
    else
      image_tag user.avatar_url(:thumb)
    end
  end
end
