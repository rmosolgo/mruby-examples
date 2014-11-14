#include "mruby.h"
#include "mruby/variable.h"
#include "mruby/string.h"

#define KNRM  "[0m"
#define KRED  "[31m"
#define KGRN  "[32m"
#define KBLU  "[34m"

static void print_led(char *print_color)
{
  printf(" \x1B%s .--. \x1B%s \n", print_color, KNRM);
  printf(" \x1B%s |^`| \x1B%s \n", print_color, KNRM);
  printf(" \x1B%s  TT  \x1B%s \n", print_color, KNRM);
}

static mrb_value fake_led_init(mrb_state* mrb, mrb_value self)
{
  mrb_value color;
  mrb_get_args(mrb, "S", &color);
  mrb_iv_set(mrb, self, mrb_intern_lit(mrb, "@color"), color);
  return self;
}

static mrb_value fake_led_illuminate(mrb_state* mrb, mrb_value self)
{
  mrb_value color = mrb_iv_get(mrb, self, mrb_intern_lit(mrb, "@color"));
  print_led(RSTRING_PTR(color));

  return mrb_nil_value();
}
