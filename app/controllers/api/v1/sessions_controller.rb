class Api::V1::SessionsController < ApplicationController

  def create
    @player = Player.find_by(username: params[:session][:username])
  
    if @player && @player.authenticate(params[:session][:password])
      session[:player_id] = @player.id
      render json: @player, status: :ok
    else
      render json: { error: "Invalid Credentials"}
    end
  end

  def get_current_user
    if logged_in?
      render json: current_user
    else 
      render json: {error: "No one logged in"}
    end
  end

  def destroy
    session.clear
    render json: {notice: "logged out successfully"}, status: :ok

  end
  
end
