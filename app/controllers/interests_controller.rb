class InterestsController < ApplicationController
  def index
  end
  
  def create
    @interest = current_user.interests.build(discussion_id: params[:discussion_id])
    
    respond_to do |format|
      if @interest.save
        format.html { redirect_to :back }
        format.json { render json: @interest, status: :created, location: @interest }
      else
        format.html { render action: "new" }
        format.json { render json: @interest.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @interest = Interest.find(params[:id])
    @interest.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
