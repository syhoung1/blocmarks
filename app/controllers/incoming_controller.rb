class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
  def create
    puts params[:sender]
    puts params[:subject]
    puts params["body-plain"]
    
    bookmark_url = params["body-plain"]
    
    if params[:sender].nil?
      User.create(name: "user" + Faker::Lorem.unique.word, email: Faker::Internet.email, password: Faker::Internet.password)
    elsif params[:subject].nil?
      Topic.create(title: Faker::Name.name, user: User.last)
    end
    
    Bookmark.create(url: bookmark_url, topic: Topic.last)

    head 200
  end
end
