#!/bin/bash

# 安装golang
sudo apt install -y golang-go

# 设置文件描述符限制
ulimit -n 200000

# 配置系统参数
echo "fs.file-max = 300000" | sudo tee -a /etc/sysctl.conf
sudo sysctl -w net.ipv4.ip_local_port_range="10000 65000"
sudo sysctl -w net.ipv4.tcp_tw_reuse=1
sudo sysctl -w net.core.somaxconn=65535
sudo sysctl -w net.core.netdev_max_backlog=250000
sudo sysctl -w net.ipv4.tcp_fin_timeout=30
sudo sysctl -p

echo "所有命令已执行完成"
