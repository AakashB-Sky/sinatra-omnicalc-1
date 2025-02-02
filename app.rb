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

get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f / 100
  years = params.fetch("user_years").to_f # might need to change this to .to_i to match target
  principal = params.fetch("user_pv").to_f
  monthly_rate = @apr / 12
  loan_months = years * 12
  
  @monthly_pmt = principal * (monthly_rate * (1 + monthly_rate) ** loan_months) / (((1 + monthly_rate) ** loan_months) - 1)
  @monthly_pmt = @monthly_pmt.round(2)

  erb(:payment_results)
end
