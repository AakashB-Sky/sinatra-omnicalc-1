require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:index)
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @num = params.fetch("number").to_i
  @num_squared = @num ** 2

  erb(:square_results)
end
