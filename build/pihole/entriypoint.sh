#!/bin/bash

echo "UP wireguard client"
wg-quick up pihole

sleep 3

echo "show wireguard status"
wg show

source /s6-init