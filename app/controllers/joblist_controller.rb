require 'open-uri'
require 'openssl'

class JoblistController < ApplicationController

  def index
    @city = params[:city]

    # sort featured job posts by when they were updated last
    featured_jobs = Job.where(location: @city, post_time: "").or(Job.where(location: @city, post_time: "featured"))
    @featured_posts = featured_jobs.order(updated_at: :desc)
    
    # sort regular job posts by age (see: class Job age method)
    jobs = Job.where(location: @city).where.not(post_time: "").where.not(post_time: "featured")
    @posts = jobs.sort_by { |obj| obj.age }

    render :index
  end
end
