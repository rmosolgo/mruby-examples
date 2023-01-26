#include "mruby.h"
#include "mruby/compile.h"

int main(void)
{
  /* make a mruby instance */
  mrb_state *mrb = mrb_open();

  /* write some code */
  char code[] = "p 'Hello world!'";

  /* use it to execute code from string */
  mrb_load_string(mrb, code); // Hence a C program is invoking ruby interpreter
                              // which in turn prints out something. 
                              // so you are running a ruby code, with a C wrapper. 
  return 0;
}

