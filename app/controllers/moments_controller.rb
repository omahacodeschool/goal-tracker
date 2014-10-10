class MomentsController < ApplicationController
  
  def index
    @moments = Moment.all
  end
  
  def new
    @moment = Moment.new
  end

  def create
    @moment = Moment.new(params[:moment])
    @goal = Goal.find_by_user_id(session[:user_id])
    @moment.goal_id = @goal.id
    
    if @moment.save
      redirect_to goal_path(@moment.goal_id)
      @moment.accumulating_value(@moment)
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
