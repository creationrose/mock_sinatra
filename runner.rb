require "./sinatra.rb"

# Procs instances get assigned to a variable, locally stored block code can be assessed later.
get "/hi" do
  puts "I am in the hi block"
end

run("/hi")

before "/hi" do
  puts "Running before block"
  puts "------------------"
end

run("/hi")

run("/random")  #Error

# Do it all again using lambdas

get '/hi', &block = lambda { puts "I am in the lambda" }
run("/hi")

before "/hi", &block = lambda { puts "Running before block"; puts "------------------" }
run("/hi")

run("/random")
