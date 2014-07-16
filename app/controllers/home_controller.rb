class HomeController < ApplicationController
  
  skip_before_filter :authenticate_user!, only: [:index]
  
  def index
  end

  def custom_form
  	
  end
end