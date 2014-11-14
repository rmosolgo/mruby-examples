#include "mruby.h"
#include "mruby/compile.h"

int main(void)
{
  /* make a mruby instance */
  mrb_state *mrb = mrb_open();

  /* write some code */
  char code[] = "p 'Hello world!'";

  /* use it to execute code from string */
  mrb_load_string(mrb, code);
  return 0;
}

