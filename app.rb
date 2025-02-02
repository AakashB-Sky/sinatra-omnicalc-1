require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:index)
end

get("/square/new") do
  erb(:square_new)
end
