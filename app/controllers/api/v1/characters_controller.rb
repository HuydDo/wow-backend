class Api::V1::CharactersController < ApplicationController

  before_action :set_player, only: [:index, :create]

  def index
    if logged_in?
      @characters = current_user.characters
      render json: @characters
    else
      render json: {error: "You must be logged in to see characters"}
    end

  end

  def show
    character = Character.find(params[:id])
    render json: character
  end

  def create
    character = @player.characters.new(character_params)
    if character.save
      render json: @player
    else
      render json: {error: 'Fail to create character'}
    end
  end

  def destroy
    character = Character.find(params[:id])
    player = Player.find(character.player_id)
    if player
      character.destroy
      render json: player
    else
      render json: {error: 'Fail to delete character'}
    end
  end

  def set_player
    @player = Player.find(params[:player_id])
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit( :name, :gender, :race, :character_class, :player_id)
  end
 
end




