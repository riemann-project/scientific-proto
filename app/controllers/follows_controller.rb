class FollowsController < ApplicationController
  def index
  end
  
  def create
    @follow = current_user.followings.build(followed_id: params[:id])
    
    respond_to do |format|
      if @follow.save
        format.html { redirect_to :back }
        format.json { render json: @follow, status: :created, location: @follow }
      else
        format.html { render action: "new" }
        format.json { render json: @follow.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def delete
    @follow = Follow.find(params[:id])
    @follo.destroy
    
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
