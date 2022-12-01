01_DIR=01_hello_world
02_DIR=02_hello_bytecode
03_DIR=03_hello_c_code
04_DIR=04_hello_classes
05_DIR=05_hello_embedded

BUILD_DIR=build

setup:
	git submodule update --init
	cd mruby; git checkout 16ed4672661f747d0483c67ca19c8ea15c084922; make
	mkdir -p $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/$(01_DIR)
	mkdir -p $(BUILD_DIR)/$(02_DIR)
	mkdir -p $(BUILD_DIR)/$(03_DIR)
	mkdir -p $(BUILD_DIR)/$(04_DIR)
	mkdir -p $(BUILD_DIR)/$(05_DIR)

#clean:
##	rm -f $(03_DIR)/hello_c_code_ruby.c
#	rm -f $(04_DIR)/fish_program.c
#	rm -f $(05_DIR)/hello_embedded_ruby.c

hello_world: #clean $(01_DIR)/hello_world.c
	gcc -c $(01_DIR)/hello_world.c -o $(01_DIR)/hello_world.o -Imruby/include
	gcc -o $(BUILD_DIR)/$(01_DIR)/hello_world $(01_DIR)/hello_world.o -lmruby -lm -Lmruby/build/host/lib
	
hello_bytecode: #clean $(02_DIR)/hello_bytecode.rb
	mruby/bin/mrbc  -o $(BUILD_DIR)/$(02_DIR)/hello_bytecode.mrb $(02_DIR)/hello_bytecode.rb

hello_c_code: #clean $(03_DIR)/hello_c_code.c $(03_DIR)/hello_c_code_ruby.rb
	mruby/bin/mrbc -B hello_c_code_ruby $(03_DIR)/hello_c_code_ruby.rb
	gcc -c $(03_DIR)/hello_c_code.c -o $(03_DIR)/hello_c_code.o -Imruby/include
	gcc -o $(BUILD_DIR)/$(03_DIR)/hello_c_code $(03_DIR)/hello_c_code.o -lmruby -lm -Lmruby/build/host/lib

hello_classes: #clean $(04_DIR)/hello_classes.c $(04_DIR)/fish_program.rb
	mruby/bin/mrbc -B fish_program $(04_DIR)/fish_program.rb
	gcc -c $(04_DIR)/hello_classes.c -o $(04_DIR)/hello_classes.o -Imruby/include
	gcc -o $(BUILD_DIR)/$(04_DIR)/hello_classes $(04_DIR)/hello_classes.o -lmruby -lm -Lmruby/build/host/lib

hello_embedded: #clean $(05_DIR)/fake_led.c $(05_DIR)/hello_embedded_ruby.rb $(05_DIR)/hello_embedded.c
	mruby/bin/mrbc -B hello_embedded_ruby $(05_DIR)/hello_embedded_ruby.rb
	gcc -c $(05_DIR)/hello_embedded.c -o $(05_DIR)/hello_embedded.o -Imruby/include
	gcc -o $(BUILD_DIR)/$(05_DIR)/hello_embedded $(05_DIR)/hello_embedded.o -lmruby -lm -Lmruby/build/host/lib

all: 
	gcc -c $(01_DIR)/hello_world.c -o $(01_DIR)/hello_world.o -Imruby/include
	gcc -o $(BUILD_DIR)/$(01_DIR)/hello_world $(01_DIR)/hello_world.o -lmruby -lm -Lmruby/build/host/lib
	
	mruby/bin/mrbc  -o $(BUILD_DIR)/$(02_DIR)/hello_bytecode.mrb $(02_DIR)/hello_bytecode.rb

	mruby/bin/mrbc -B hello_c_code_ruby $(03_DIR)/hello_c_code_ruby.rb
	gcc -c $(03_DIR)/hello_c_code.c -o $(03_DIR)/hello_c_code.o -Imruby/include
	gcc -o $(BUILD_DIR)/$(03_DIR)/hello_c_code $(03_DIR)/hello_c_code.o -lmruby -lm -Lmruby/build/host/lib

	mruby/bin/mrbc -B fish_program $(04_DIR)/fish_program.rb
	gcc -c $(04_DIR)/hello_classes.c -o $(04_DIR)/hello_classes.o -Imruby/include
	gcc -o $(BUILD_DIR)/$(04_DIR)/hello_classes $(04_DIR)/hello_classes.o -lmruby -lm -Lmruby/build/host/lib

	mruby/bin/mrbc -B hello_embedded_ruby $(05_DIR)/hello_embedded_ruby.rb
	gcc -c $(05_DIR)/hello_embedded.c -o $(05_DIR)/hello_embedded.o -Imruby/include
	gcc -o $(BUILD_DIR)/$(05_DIR)/hello_embedded $(05_DIR)/hello_embedded.o -lmruby -lm -Lmruby/build/host/lib