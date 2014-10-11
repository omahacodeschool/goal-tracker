class PagesController < ApplicationController
  skip_before_filter :require_login, only: [:index]
  
  def index
  end
  
  def dashboard
    @goals = current_user.goals
    @goal = Goal.find_by_id(params[:id])
    #@moments = @goal.moments
    @moment = Moment.new
    binding.pry
    
    respond_to do |format|
      format.html 
      format.json { render json: @goal }
    end
  end
  
end
