#!/usr/bin/bash

dnf install -y firefox tigervnc-server git maven
cp /usr/lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@.service
sed -i "s/<USER>/root/g" /etc/systemd/system/vncserver@.service
git clone https://github.com/xebia/Xebium.git
