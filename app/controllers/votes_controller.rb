class VotesController < ApplicationController

  def create 
    job = Job.find(params[:data][:job])
    job.liked_by current_user
  end
  
  def destroy
    vote = Vote.find_by(voter_id: current_user, votable_id: params[:job_id])
    Vote.destroy(vote.id)
    redirect_to current_user
  end


end
