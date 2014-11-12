// adapted from http://matt.aimonetti.net/posts/2012/04/25/getting-started-with-mruby/
#include "mruby.h"
#include "mruby/compile.h"

int main(void)
{
  /* make a mruby instance  & some code */
  mrb_state *mrb = mrb_open();
  char code[] = "p 'Hello world!'";

  /* use it to execute code from string */
  mrb_load_string(mrb, code);
  return 0;
}

