class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_filter :global_language

  private

    def global_language
      if params.has_key?(:locale)
        I18n.locale = params[:locale]
      else
        if I18n.locale.blank?
          I18n.locale = 'en'
        end
      end
    end

    def self.default_url_options
      { :locale => I18n.locale }
    end
end
