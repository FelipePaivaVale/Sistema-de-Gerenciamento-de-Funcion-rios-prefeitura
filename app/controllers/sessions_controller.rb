class SessionsController < Devise::SessionsController
    def create
      self.resource = warden.authenticate!(auth_options)
      if resource.password_reset_required?
        sign_in(resource_name, resource)
        redirect_to edit_user_password_path, alert: 'Por favor, altere sua senha provisória.'
      else
        super
      end
    end
end
  