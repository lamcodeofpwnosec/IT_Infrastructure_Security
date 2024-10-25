#!/bin/bash
sudo apt update && sudo apt install cowrie -y
sudo systemctl enable cowrie && sudo systemctl start cowrie
