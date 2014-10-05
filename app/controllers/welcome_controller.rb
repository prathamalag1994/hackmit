class WelcomeController < ApplicationController
  def index
  	  @se = current_user
  end
end
