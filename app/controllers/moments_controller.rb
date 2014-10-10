class MomentsController < ApplicationController
  
  def index
    @moments = Moment.all
  end
  
  def new
    @moment = Moment.new
  end

  def create
    @moment = Moment.new(params[:moment])
    
    if @moment.save
      @moment.accumulating_value(@moment)
      redirect_to goal_path(@moment.goal_id)
    else
      render goal_path(params[:goal_id])
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
