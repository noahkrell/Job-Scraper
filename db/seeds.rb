require 'open-uri'
require 'openssl'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


cities = ["Austin", "Boston", "Colorado", "LA", "NYC"]
cities.each do |city| 
  # unique URL for each city
  url = "https://www.builtin" + city + ".com/jobs?f[0]=job-category_107&f[1]=job-category_324&f[2]=experience_level_1&f[3]=experience_level_1-3&f[4]=experience_level_3-5"
  doc = Nokogiri::HTML(open(url, :ssl_verify_mode => OpenSSL::SSL::VERIFY_NONE))

  doc.css(' div.original > div.center-left').each do |node|
    # search the db for the job by its unique URL
    job = Job.find_by(link: "https://www.builtin" + city + ".com" + node.children.css('.wrap-view-page').children.attr('href').value)
    # if the job doesn't exist in the db, create new Job object with the relevant information from the node 
    if job.nil?
      job = Job.new(title: node.children.css('.title').text,
                company: node.children.css('.company-title').text,
                location: city,
                description: node.children.css('.description').text,
                link: "https://www.builtin" + city + ".com" + node.children.css('.wrap-view-page').children.attr('href').value,
                post_time: node.next_element.children.css('.job-date').text
                )
    # otherwise, update the post_time attribute to stay current
    else
      job.post_time = node.next_element.children.css('.job-date').text
    end

    job.save
  end
end






