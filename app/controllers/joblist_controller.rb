require 'open-uri'
require 'openssl'

class JoblistController < ApplicationController

  def index
    @city = params[:city]
    #nokogiri stuff
    url = "https://www.builtin#{@city}.com/jobs?f[0]=job-category_107&f[1]=job-category_324&f[2]=experience_level_1&f[3]=experience_level_1-3&f[4]=experience_level_3-5"
    doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

    #collecting each job post
    @posts = []
    doc.css(' div.original > div.center-left').each do |node|
      @posts << {
        "title" => node.children.css('.title').text,
        "company" => node.children.css('.company-title').text,
        "description" => node.children.css('.description').text,
        "link" => "https://www.builtin#{@city}.com" + node.children.css('.wrap-view-page').children.attr('href').value,
        "post-time" => node.next_element.children.css('.job-date').text
        }
    end
    render :index
  end
end
