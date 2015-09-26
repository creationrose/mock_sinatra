require "./sinatra.rb"

# Procs instances get assigned to a hash value, locally stored block code can be assessed later.
get "/hi" do
  puts "I am the hi proc in a hash."
  puts "My key is me and my data is a proc."
end

run("/hi")

before "/hi" do
  puts "I am the before filter proc in a hash."
  puts "My key is hi and my data is a proc"
  puts "But I'm a different hash than get is."
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
