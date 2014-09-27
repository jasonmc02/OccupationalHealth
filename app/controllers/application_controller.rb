class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :global_language
  before_filter :clean_request_format

  private

    def global_language
      if params.has_key?(:locale)
        if ["en", "es"].include?(params[:locale].to_s)
          I18n.locale = params[:locale]
        else
          I18n.locale = :en
          redirect_to home_index_path
        end
      else
        I18n.locale = :en
      end
    end

    def self.default_url_options
      { :locale => I18n.locale }
    end

    def check_user_ability
      unless current_user.role_id == Rails.configuration.admin_role
        request = nil
        params = nil
        redirect_to home_index_path
      end
    end

    def clean_request_format
      unless ["text/html", "application/json", "text/javascript"].include?(request.format.to_s)
        request = nil
        params = nil
        redirect_to home_index_path
      end
    end
end
