class Fish
  def swim
    "<'(((< #{("~" * [1,3,5].sample)}"
  end
end

5.times do
  f = Fish.new
  str = f.swim
  puts str
end