class VotesController < ApplicationController
  def vote_good
    if Vote.exists?(user_id: current_user.id, answer_id: params[:answer_id])
      @vote = current_user.votes.find_by_answer_id(params[:answer_id])
      @vote.update_attribute(:value, 1)
    else
      @vote = current_user.votes.build(answer_id: params[:answer_id], value: 1)
      @vote.save
    end
    
    redirect_to :back
  end
  
  def vote_bad
    if Vote.exists?(user_id: current_user.id, answer_id: params[:answer_id])
      @vote = current_user.votes.find_by_answer_id(params[:answer_id])
      @vote.update_attribute(:value, -1)
    else
      @vote = current_user.votes.build(answer_id: params[:answer_id], value: -1)
      @vote.save
    end
    
    redirect_to :back
    
  end
  
  def destroy
    @vote = current_user.votes.find_by_answer_id(params[:answer_id])
    @vote.delete
    
    redirect_to :back
  end
end
