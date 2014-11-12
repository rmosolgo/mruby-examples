// adapted from https://github.com/carsonmcdonald/mruby-c-example/blob/master/simple_class.c
#include "mruby.h"
#include "mruby/irep.h"

#include "fish_program.c"

static mrb_value
fish_swim(mrb_state* mrb, mrb_value obj)
{
  fprintf(stderr, "Fish swim!\n");
  return mrb_nil_value();
}

static mrb_value
fish_init(mrb_state* mrb, mrb_value self)
{
  char *name = NULL;
  mrb_get_args(mrb, "z", &name);

  fprintf(stderr, "\n\n<'(((<\nA new fish is born: %s\n", name);

  return self;
}


int main(void)
{
  /* make a VM */
  mrb_state *mrb = mrb_open();

  /* make a class and give it some methods */
  struct RClass *fish_class = mrb_define_class(mrb, "Fish", mrb->object_class);

  mrb_define_method(mrb, fish_class, "initialize", fish_init, MRB_ARGS_REQ(1));
  mrb_define_method(mrb, fish_class, "swim!", fish_swim, MRB_ARGS_REQ(1));

  /* run your instructions with that ruby state */
  mrb_load_irep(mrb, fish_program);

  mrb_close(mrb);
  return 0;
}
