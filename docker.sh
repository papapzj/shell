#!/bin/bash
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo 
wget -O /etc/yum.repos.d/CentOS-Base-163.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
yum clean all && yum makecache
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl restart docker
systemctl enable docker
