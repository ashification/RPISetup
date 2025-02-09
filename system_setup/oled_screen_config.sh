#!/bin/bash

# Source Material: https://wiki.52pi.com/index.php?title=ZP-0172#How_to_assemble_it

sudo apt -y install python3 python3-pip python3-pil libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libopenjp2-7 
git clone https://github.com/geeekpi/luma.examples.git
cd luma.examples/
sudo -H pip3 install -e . --break-system-packages
cd examples/
python3 clock.py