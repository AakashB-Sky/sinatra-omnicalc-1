require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:index)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  num = params.fetch("number").to_f # might want to think of a way to only show decimal place if not whole number
  @num_squared = (num ** 2).to_f

  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end

get("/square_root/results") do
  num = params.fetch("number").to_f
  @num_square_root = (num ** (0.5)).to_f

  erb(:square_root_results)
end

get("/random/new") do
  erb(:random_new)
end

get("/random/results") do
  minimum = params.fetch("user_min").to_f
  maximum = params.fetch("user_max").to_f
  
  @random_number = rand(minimum..maximum)

  erb(:random_results)
end
