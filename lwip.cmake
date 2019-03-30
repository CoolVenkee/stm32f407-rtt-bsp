include_directories(
        ${RTT_ROOT}/components/net/lwip-2.0.2/src
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/include
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/include/ipv4
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/arch/include
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/include/netif
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/include/posix
)
file(GLOB_RECURSE LWIP_SOURCES
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/api/pi_msg.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/api/pi_lib.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/api/rr.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/api/etbuf.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/api/etdb.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/api/netifapi.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/api/sockets.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/api/tcpip.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/arch/sys_arch.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/def.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/dns.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/inet_chksum.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/init.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/ip.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/ipv4/autoip.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/ipv4/dhcp.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/ipv4/etharp.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/ipv4/icmp.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/ipv4/igmp.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/ipv4/ip4.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/ipv4/ip4_addr.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/ipv4/ip4_frag.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/memp.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/netif.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/pbuf.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/raw.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/stats.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/sys.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/tcp.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/tcp_in.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/tcp_out.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/timeouts.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/core/udp.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/netif/ethernet.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/netif/ethernetif.c
        ${RTT_ROOT}/components/net/lwip-2.0.2/src/netif/lowpan6.c

        )
