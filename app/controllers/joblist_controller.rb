require 'open-uri'
require 'openssl'

class JoblistController < ApplicationController

  def index
    @city = params[:city]
    @posts = Job.where(location: @city)
    render :index
  end
end
