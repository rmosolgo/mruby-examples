["grouper", "croaker", "shark"].each do |fish_name|
  fish = Fish.new(fish_name)
  fish.swim!
end

# This code will not run by its own. 
# Try to run it by "ruby fish_program.rb"
# You'll get an error. 