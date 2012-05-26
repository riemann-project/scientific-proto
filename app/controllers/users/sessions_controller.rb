class Users::SessionsController < Devise::SessionsController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create, :mobile_new ]
  
  def mobile_new
    resource = build_resource(nil)
    clean_up_passwords(resource)
    # respond_with(resource, serialize_options(resource))
    
    render template: "devise/sessions/mobile_new", layout: nil
  end
  
  def mobile_create
    resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    # respond_with resource, :location => after_sign_in_path_for(resource)
    
    redirect_to root_path
  end
end
