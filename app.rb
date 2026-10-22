require_relative "config/application"
require "sinatra"
require "sinatra/reloader"
require "sinatra/activerecord"
require "pry-byebug"

get "/" do
  # a list of all of my restaurants
  # take all the restaurants and pass them to the view
  @restaurants = Restaurant.all # array of restaurant instances
  
  erb :index
end

# https://www.airbnb.com/rooms/742429999613727603
# /restaurants/6

get "/restaurants/:id" do
  id = params[:id]
  @restaurant = Restaurant.find(id) # the instance with that id

  erb :show
end

# http://localhost:4567/?name=Clandestino&city=Nakameguro
# {"name"=>"Clandestino", "city"=>"Nakameguro"} params

post "/restaurants" do
  # insert data from the params into the DB
  name = params[:name]
  city = params[:city]
  restaurant = Restaurant.new(name: name, city: city)
  restaurant.save
  redirect "/"
end

# HTTP VERBS
# 
# GET (get the data)
# POST (te create new data in my app)
# PUT/PATCH (to update)
# DELETE (to delete)
