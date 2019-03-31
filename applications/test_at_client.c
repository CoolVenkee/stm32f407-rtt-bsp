//
// Created by Venkee on 2019/3/31.
//

#include <rtthread.h>
#include <at.h>

int test_at_client_init(int argc, char **argv)
{
    at_client_init("uart3", 512);

    return RT_EOK;
}
MSH_CMD_EXPORT_ALIAS(test_at_client_init, at_client_init, initialize AT client);
