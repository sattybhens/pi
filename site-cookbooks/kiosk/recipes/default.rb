#
# Cookbook Name:: kiosk
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'unclutter'
package 'chromium'
package 'x11-xserver-utils'

template "/etc/xdg/lxsession/LXDE/autostart" do
  source "autostart.erb"
  action :create 
end

template "/etc/rc.local" do
  source "rc.local.erb"
  action :create 
end
