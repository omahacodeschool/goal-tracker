class PagesController < ApplicationController
  skip_before_filter :require_login, only: [:index]
  
  def index
  end
  
  def dashboard
    @goals = Goal.all
    @goal = Goal.find_by_id(params[:id])
    @moment = Moment.new
    
    respond_to do |format|
      format.html 
      format.json { render json: @goal }
    end
  end
  
end
