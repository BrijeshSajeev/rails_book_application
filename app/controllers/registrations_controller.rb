class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :age])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :sex, :age])
  end

  def after_sign_in_path_for(resource)
    books_path # Redirect to the books page after login
  end

  def after_sign_up_path_for(resource)
    books_path 
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path # Redirect to the welcome page
  end
end
