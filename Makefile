01_DIR=01_hello_world
02_DIR=02_hello_bytecode
03_DIR=03_hello_c_code
04_DIR=04_hello_classes
05_DIR=05_hello_embedded

BUILD_DIR=build

setup:
	git submodule update
	cd mruby; make

clean:
	rm -f build/*
	rm -f $(04_DIR)/fish_program.c
	rm -f $(05_DIR)/hello_embedded_ruby.c

hello_world: clean $(01_DIR)/hello_world.c
	gcc -c $(01_DIR)/hello_world.c -o $(01_DIR)/hello_world.o -Imruby/include
	gcc -o $(BUILD_DIR)/hello_world $(01_DIR)/hello_world.o -lmruby -lm -Lmruby/build/host/lib
	@echo "---\nInterpret a Ruby string inside a C program: $(BUILD_DIR)/hello_world\n---"

hello_bytecode: clean $(02_DIR)/hello_bytecode.rb
	mruby/bin/mrbc $(BUILD_DIR)/hello_bytecode.rb
	@echo "---\nRun bytecode with mruby: mruby/bin/mruby -b $(BUILD_DIR)/hello_bytecode.mrb\n---"

hello_c_code: clean $(03_DIR)/hello_c_code.c $(03_DIR)/hello_c_code_ruby.rb
	mruby/bin/mrbc -B hello_c_code_ruby $(03_DIR)/hello_c_code_ruby.rb
	gcc -c $(03_DIR)/hello_c_code.c -o $(03_DIR)/hello_c_code.o -Imruby/include
	gcc -o $(BUILD_DIR)/hello_c_code $(03_DIR)/hello_c_code.o -lmruby -lm -Lmruby/build/host/lib
	@echo "---\nRun bizarre Ruby + C hybrid binary: $(BUILD_DIR)/hello_c_code\n---"


hello_classes: clean $(04_DIR)/hello_classes.c $(04_DIR)/fish_program.rb
	mruby/bin/mrbc -B fish_program $(04_DIR)/fish_program.rb
	gcc -c $(04_DIR)/hello_classes.c -o $(04_DIR)/hello_classes.o -Imruby/include
	gcc -o $(BUILD_DIR)/hello_classes $(04_DIR)/hello_classes.o -lmruby -lm -Lmruby/build/host/lib
	@echo "---\nUse C code in Ruby code: $(BUILD_DIR)/hello_classes\n---"

hello_embedded: clean $(05_DIR)/fake_led.c $(05_DIR)/hello_embedded_ruby.rb $(05_DIR)/hello_embedded.c
	mruby/bin/mrbc -B hello_embedded_ruby $(05_DIR)/hello_embedded_ruby.rb
	gcc -c $(05_DIR)/hello_embedded.c -o $(05_DIR)/hello_embedded.o -Imruby/include
	gcc -o $(BUILD_DIR)/hello_embedded $(05_DIR)/hello_embedded.o -lmruby -lm -Lmruby/build/host/lib
	@echo "---\nUse Ruby wrapper for C API: $(BUILD_DIR)/hello_embedded\n---"