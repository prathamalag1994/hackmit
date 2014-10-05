class WelcomeController < ApplicationController
  def index
  	  @se = user_signed_in?
  end
end
