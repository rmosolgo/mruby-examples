# mruby Examples

## Setup

```
$ make setup
```

It should:

- check out the `mruby` submodule
- `cd mruby` and `make` to build mruby

## Hello World

Run Ruby code from a string inside a C application.

```
$ make hello_world
$ build/hello_world
```

## Hello Bytecode

Compile Ruby code to mruby (RiteVM) bytecode, then run it with mruby.

```
$ make hello_bytecode
$ mruby/bin/mruby -b build/hello_bytecode.mrb
```

## Hello C Code

Compile Ruby to bytecode, then execute that bytecode inside a C application.

```
$ make hello_c_code
$ build/hello_c_code
```

## Hello Classes

Build a Ruby class in C, then use that Ruby class in your Ruby code.


```
$ make hello_classes
$ build/hello_classes
```

## Hello Embedded

Pretend you were accessing some hardware-ish thing by C API.

`fake_led.c` is my pretend LEDs. Wrap it in a Ruby class, then use that in Ruby code. The Ruby code is executed inside the C application.

```
$ make hello_embedded
$ build/hello_embedded
```

