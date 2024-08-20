class ApplicationController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private

    def user_not_authorized
        flash[:alert] = "Você não tem permissão para realizar essa ação."
        
    endinclude Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
    end 
    private

    def user_not_authorized
        flash[:alert] = "Você não tem permissão para realizar essa ação."
        
    end
end
