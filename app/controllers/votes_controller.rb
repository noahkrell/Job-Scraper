class VotesController < ApplicationController

  def create 
    job = Job.find(params[:data][:job])
    job.liked_by current_user
  end

end
