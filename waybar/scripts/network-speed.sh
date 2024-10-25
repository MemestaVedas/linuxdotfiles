#!/bin/bash

# Network interface (e.g., enp3s0 or wlan0; adjust to your network interface)
INTERFACE="wlp2s0"

# Get the network stats from /proc/net/dev
rx1=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
tx1=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)
sleep 1
rx2=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)
tx2=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)

# Calculate the download and upload speed (in bytes per second)
rx_rate=$(( (rx2 - rx1) / 1024 ))  # kbps
tx_rate=$(( (tx2 - tx1) / 1024 ))  # kbps

# Output in kbps
echo " ${rx_rate}KB/s  ${tx_rate}KB/s"

