//
// Created by Venkee on 2019/3/31.
//

#include <rtthread.h>
#include <rtdevice.h>
#include <board.h>
#include <button.h>

#define KEY1_PIN    GET_PIN(F, 13)
#define KEY2_PIN    GET_PIN(F, 14)
#define KEY3_PIN    GET_PIN(F, 15)

static Button_t key1;
static Button_t key2;
static Button_t key3;

#define LED2_PIN    GET_PIN(A, 5)

static rt_base_t status = PIN_LOW;

static rt_uint8_t on_read_key_level(void)
{
    return rt_pin_read(KEY1_PIN);
}

static void on_key_event_callback(void *key)
{
    rt_pin_write(LED2_PIN, status);

    status = (status == PIN_LOW) ? PIN_HIGH : PIN_LOW;
}

static void key_detect_thread_entry(void *arg)
{
    while(1) {
        Button_Process();
        rt_thread_mdelay(20);
    }
}

static int test_button(int argc, char *argv[])
{
    rt_thread_t tid;

    rt_pin_mode(KEY1_PIN, PIN_MODE_INPUT_PULLUP);
    rt_pin_mode(LED2_PIN, PIN_MODE_OUTPUT);

    Button_Create("KEY1", &key1, on_read_key_level, 0);
    Button_Attach(&key1, BUTTON_DOWM, on_key_event_callback);

    tid = rt_thread_create("key", key_detect_thread_entry, RT_NULL, 1024, 31, 10);
    if (tid)
    {
        rt_thread_startup(tid);
    }
}
MSH_CMD_EXPORT(test_button, test_button);
