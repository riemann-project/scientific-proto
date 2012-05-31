class FollowsController < ApplicationController
  def index
  end
  
  def create
    @follow = current_user.follows.build(followed_id: params[:user_id])
    
    respond_to do |format|
      if @follow.save
        @log = current_user.logs.create(loggable_type: "Follow", loggable_id: @follow.id)
        format.html { redirect_to :back }
        format.json { render json: @follow, status: :created, location: @follow }
      else
        format.html { render action: "new" }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
