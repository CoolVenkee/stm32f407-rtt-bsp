//
// Created by Venkee on 2019/3/31.
//

#include <rtthread.h>
#include <rtdevice.h>

static rt_device_t  wdt_dev;
static rt_tick_t cur_tick;

static void idle_hook(void)
{
    rt_tick_t diff_tick;

    diff_tick = rt_tick_get() - cur_tick;
    if (diff_tick > 500)
    {
        /* 在空闲线程的回调函数里喂狗 */
        rt_device_control(wdt_dev, RT_DEVICE_CTRL_WDT_KEEPALIVE, NULL);
        rt_kprintf("feed the watchdog\n ");

        cur_tick = rt_tick_get();
    }
}

static int test_wdt(int argc, char *argv[])
{
    rt_err_t ret = RT_EOK;
    rt_uint32_t timeout = 1000;

    /* 查找看门狗设备 */
    wdt_dev = rt_device_find("wdt");
    if (!wdt_dev)
    {
        rt_kprintf("find watchdog timer device failed\n");
        return RT_ERROR;
    }

    /* 初始化看门狗 */
    ret = rt_device_init(wdt_dev);
    if (ret != RT_EOK)
    {
        rt_kprintf("init watchdog timer device failed, ret=%d\n", ret);
        return RT_ERROR;
    }

    /* 设置看门狗溢出时间 */
    ret = rt_device_control(wdt_dev, RT_DEVICE_CTRL_WDT_SET_TIMEOUT, &timeout);
    if (ret != RT_EOK)
    {
        rt_kprintf("control watchdog timer device failed, ret=%d\n", ret);
        return RT_ERROR;
    }

    cur_tick = rt_tick_get();

    /* 设置回调来喂狗 */
    rt_thread_idle_sethook(idle_hook);

    return ret;
}
MSH_CMD_EXPORT(test_wdt, test_wdt);