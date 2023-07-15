#!/usr/bin/env bash
set -e

/usr/sbin/privoxy --no-daemon /privoxy/config &
openvpn --config /vpn/config.ovpn --auth-user-pass /vpn/user.txt