class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :cancel ]
  layout 'registrations'

  def door
    render template: "devise/registrations/door"
  end
  
  def new_authmail
    render template: "devise/registrations/new_authmail"
  end
  
  def show_inbox
    render template: "devise/registrations/show_inbox"
  end
  
  protected
  
  def after_sign_up_path_for(resource)
    new_authmail_path
  end

  def after_inactive_sign_up_path_for(resource)
    new_authmail_path
  end
end