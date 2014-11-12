["grouper", "croaker", "shark"].each do |fish_name|
  fish = Fish.new(fish_name)
  fish.swim!
end
