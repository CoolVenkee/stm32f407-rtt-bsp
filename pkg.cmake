include_directories(packages/button-v1.0.1)

file(GLOB_RECURSE PKG_SOURCES
        packages/button-v1.0.1/button.c
        packages/at_device-latest/at_socket_esp8266.c
        )
