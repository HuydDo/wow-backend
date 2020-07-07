class Api::V1::PlayersController < ApplicationController
  
  before_action :set_player, only: [:show, :destroy, :update]

  def index
    # binding.pry

    player = Player.all
    render json: player
  end

  def create
    player = Player.new(player_params)
    if player.save
      session[:player_id] = player.id
      render json: player, status: :created
    else
      resp = {
        error: player.errors.full_messages.to_sentence
      }
      render json: resp, status: :unprocessable_entity
      # render json: {error: 'Fail to create player'}
    end
  end

  def show
    render json: @player
  end

  def destroy
    if @player
      @player.destroy
      render json: @player
    else
      render json: {error: 'Fail to delete player'}
    end
  end

  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: {error: 'Fail to update player'}
    end
  end
  

  private

  def set_player
    @player = Player.find(params[:id])
  end

 
  def player_params
    params.require(:player).permit(:name, :username, :password)
  end
end
