class RoomsController < ApplicationController
  
  before_action :set_room,  only: [:edit, :update, :show, :destroy]
  
  def index
    @rooms = Room.all  
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "성공적으로 포스팅이 작성되었습니다."
      redirect_to room_path(@room)
    else
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @room.save
      flash[:notice] = "성공적으로 업데이트 되었습니다."
      redirect_to room_path(@room)
    else
      render 'edit'
    end
  end
  
  def destroy
    @room.destroy
    flash[:notice] = "포스팅이 성공적으로 지워졌습니다."
    redirect_to rooms_path
  end
  
  private
  
    def set_room
      @room = Room.find(params[:id])
    end
    def room_params
      params.require(:room).permit(:title,:description)
    end
    
end