red = FakeLED.new(FakeLED::RED)
green = FakeLED.new(FakeLED::GREEN)
blue = FakeLED.new(FakeLED::BLUE)

lights = [red, green, blue]

10.times do
  lights.sample.illuminate!
end