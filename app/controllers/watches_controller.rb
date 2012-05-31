class WatchesController < ApplicationController
  def index
  end
  
  def create
    @watch = current_user.watches.build(problem_id: params[:problem_id])

    @log = current_user.logs.build(loggable_type: "Watch", loggable_id: @watch.id, action: "create")

    respond_to do |format|
      if @watch.save
        @log.save
        format.html { redirect_to :back }
        format.json { render json: @watch, status: :created, location: @watch }
      else
        format.html { render action: "new" }
        format.json { render json: @watch.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @watch = Watch.find(params[:id])
    @watch.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
