class Api::RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end

  def create
    room_params = params.permit(:description, :title, :game_id)

    @room = Room.new room_params
    @room.host = current_player

    @room.save!
  end

  def destroy
    room = Room.find(params[:id])
    authorize room
    room.destroy!
  end

end

