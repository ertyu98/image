#!/bin/bash
mkdir /nfs-shared
chmod 777 /nfs-shared
echo "/nfs-shared 10.0.0.0/149(rw,sync) >> /etc/export
systemctl restart nfs-server
systemctl enable nfs-server
ec2-metadata -o | cut -d ' ' -f 2 >> /nfs-shared/list.txt
chmof 777 /nfs-shared/list.txt
