require 'open-uri'
require 'openssl'

class JoblistController < ApplicationController

  def index
    @city = params[:city]
    jobs = Job.where(location: @city)
    # sort the job posts by age (see: class Job age method)
    @posts = jobs.sort_by { |obj| obj.age }
    render :index
  end
end
