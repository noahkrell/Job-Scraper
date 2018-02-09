class VotesController < ApplicationController

  def create 
    job = Job.find(params[:data][:job])
    job.liked_by current_user
    render(
      html: "<script>alert('Job Saved. Check ya profile')</script>")
  end

end
