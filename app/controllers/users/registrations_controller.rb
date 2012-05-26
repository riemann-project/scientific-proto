class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  
  def door
    render template: "devise/registrations/door"
  end
  
  def show_inbox
    render template: "devise/registrations/show_inbox"
  end
  
  protected

  def after_inactive_sign_up_path_for(resource)
    show_inbox_path
  end
end