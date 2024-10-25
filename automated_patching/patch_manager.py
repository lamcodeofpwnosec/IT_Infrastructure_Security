import os

def apply_patches():
    os.system('sudo apt update && sudo apt upgrade -y')
apply_patches()
