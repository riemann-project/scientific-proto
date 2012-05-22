class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  
  def door
    render template: "devise/registrations/door"
  end
  
  def new_authmail
    render template: "devise/registrations/new_authmail"
  end
  
  def show_inbox
    render template: "devise/registrations/show_inbox"
  end
  
  def after_confirm
    render template: "devise/registrations/after_confirm"
  end
  
  def after_sign_up_path_for(resource)
    sign_up_2_path
  end
  
  def after_confirmation_path_for(resource)
    super resource
  end
end