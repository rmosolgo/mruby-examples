# Make a Ruby class
class Fish
  LENGTHS = [1,3,5]

  def swim!
    random_length = "~" * LENGTHS.sample
    puts "<'(((< #{random_length}"
  end
end

# write your program
5.times do
  f = Fish.new
  f.swim!
end