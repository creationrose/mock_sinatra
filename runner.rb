require "./sinatra.rb"

get "/hi" do
  puts "I am the hi method"
end

#Proc instance gets assigned to a variable, locally stored block code can be assessed later

run("/hi")

run("/random")  #Error