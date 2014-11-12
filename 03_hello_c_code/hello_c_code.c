// More info: http://blog.mruby.sh/201207020720.html "Five ways to execute mruby"
#include "mruby.h"
#include "mruby/irep.h"
#include "mruby/proc.h"

#include "hello_c_code_ruby.c"

int main(void)
{
  /* new interpreter instance */
  mrb_state *mrb;
  mrb = mrb_open();

  /* read and execute compiled instructions */
  mrb_load_irep(mrb, hello_c_code_ruby);

  mrb_close(mrb);

  return 0;
}