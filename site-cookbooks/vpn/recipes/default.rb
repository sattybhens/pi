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
