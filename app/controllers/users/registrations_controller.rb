class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  
  def after_confirmation
    render template: "users/registrations/after_confirmation"
  end
  
  def after_confirmation
    
  end
  
  def after_sign_up_path_for(resource)
    sign_up_2_path
  end
  
  def after_confirmation_path_for(resource)
    super resource
  end
end