class Users::ConfirmationsController < Devise::ConfirmationsController

  def after_confirm
    if not user_signed_in?
      redirect_to door_path
    end
  end

  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super resource_name
  # end

  def after_confirmation_path_for(resource_name, resource)
    after_confirm_path
  end
end