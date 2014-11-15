// More info: http://blog.mruby.sh/201207020720.html "Five ways to execute mruby"
#include "mruby.h"
#include "mruby/irep.h"
#include "mruby/proc.h"

#include "fake_led.c"
#include "hello_embedded_ruby.c"

int main(void)
{
  /* new interpreter instance */
    mrb_state *mrb;
    mrb = mrb_open();

  /* modify interpreter state */
    // FakeLED class
    struct RClass *fake_led_class = mrb_define_class(mrb, "FakeLED", mrb->object_class);

    // Instance methods in FakeLED
    mrb_define_method(mrb, fake_led_class, "initialize", fake_led_init, MRB_ARGS_REQ(1));
    mrb_define_method(mrb, fake_led_class, "illuminate!", fake_led_illuminate, MRB_ARGS_REQ(1));

    // Constants nested in FakeLED, eg FakeLED::RED
    // They define the available colors of LED (maybe these would be pin numbers IRL)
    mrb_define_const(mrb, fake_led_class, "RED", mrb_str_new(mrb, KRED, 4));
    mrb_define_const(mrb, fake_led_class, "BLUE", mrb_str_new(mrb, KBLU, 4));
    mrb_define_const(mrb, fake_led_class, "GREEN", mrb_str_new(mrb, KGRN, 4));

  /* read and execute compiled symbols */
    mrb_load_irep(mrb, hello_embedded_ruby);

  mrb_close(mrb);

  return 0;
}