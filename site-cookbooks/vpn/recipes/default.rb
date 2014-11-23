#
# Cookbook Name:: pi
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"

package "network-manager-openvpn" do action :install end

template "/etc/openvpn/client.conf" do
  source "client.conf.erb"
  action :create 
end

template "/home/pi/auth.txt" do
  source "auth.txt.erb"
  action :create 
end

remote_file "/etc/openvpn/ca.vyprvpn.com.crt" do
  source "https://www.goldenfrog.com/downloads/ca.vyprvpn.com.crt"
end

