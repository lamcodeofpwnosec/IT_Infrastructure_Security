#!/bin/bash
sudo apt update && sudo apt install wireguard -y
wg genkey | tee private.key | wg pubkey > public.key
