require "./sinatra.rb"

get "/hi" do
  puts "I am the hi method"
end

#Proc instance gets assigned to a variable, locally stored block code can be assessed later

run("/hi")

before "/hi" do
  puts "Running before filter"
  puts "------------------"
end

#run("/random")  #Error