require 'open-uri'
require 'openssl'

class JoblistController < ApplicationController

  def index
    @city = params[:city]
    
    # sort featured job posts by when they were updated last
    featured_jobs = Job.where(location: @city, post_time: "")
    @featured_posts = featured_jobs.order(updated_at: :desc)
    
    # sort regular job posts by age (see: class Job age method)
    jobs = Job.where(location: "Austin").where.not(post_time: "")
    @posts = jobs.sort_by { |obj| obj.age }

    render :index
  end
end
