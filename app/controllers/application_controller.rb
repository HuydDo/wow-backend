class ApplicationController < ActionController::API
  include ::ActionController::Cookies
  
  def current_user
     Player.find_by(id: session[:player_id])
  end

  def logged_in?
    !!current_user
  end

 

end
