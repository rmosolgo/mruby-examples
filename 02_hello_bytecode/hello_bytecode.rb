# More info: http://blog.mruby.sh/201207020720.html "Five ways to execute mruby"
5.times do |n|
  excitement = "!" * (n+1)
  puts "I love writing Ruby code#{excitement}"
end


# Expanation
# ------------------
# You have this ruby code.
# you can run it by `ruby hello_bytecode.rb`
# What is happening is ruby interpreter is going line by line
# interpreting the code and executing the code. This is inherently 
# a slow process.

# What you can do with mruby, is compile the code.
# You can compile the code into bytecode by "mrbc" 
# program. Which will give you a ".mrb" file.
# Next you can use "mruby" and invoke the file
# with a "-b" parameter.

# So you are running the same ruby code, but compiled version. 