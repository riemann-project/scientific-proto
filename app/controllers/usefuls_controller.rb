class UsefulsController < ApplicationController
  def create
    @useful = current_user.usefuls.build(reference_id: params[:reference_id])

    respond_to do |format|
      if @useful.save
        format.html { redirect_to :back }
        format.json { render json: @useful, status: :created, location: @useful }
      else
        format.html { render action: "new" }
        format.json { render json: @useful.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @useful = Useful.find(params[:id])
    @useful.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
