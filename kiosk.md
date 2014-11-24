### Kiosk mode

[HOWTO:Boot you Raspberry Pi into a fullscreen browser kisok](http://blogs.wcode.org/2013/09/howto-boot-your-raspberry-pi-into-a-fullscreen-browser-kiosk/)

[Raspberry Pi Kiosk Screen Tutorial](https://www.danpurdy.co.uk/web-development/raspberry-pi-kiosk-screen-tutorial/)

[Raspberry pi boot straight into a GUI application](http://simonmcc.blogspot.com/2013/09/raspberry-pi-boot-straight-into-gui.html)

Installed the following packages
- unclutter (hides mouse when inactive)
- chromium
- x11-xserver-utils

Updated /etc/xdg/lxsession/LXDE/autostart
```
@lxpanel --profile LXDE
@pcmanfm --desktop --profile LXDE
#@xscreensaver -no-splash

@xset s off 
@xset -dpms 
@xset s noblank 

@sed -i 's/"exited_cleanly": false/"exited_cleanly": true/' ~/.config/chromium/Default/Preferences

@chromium --incognito --noerrdialogs --kiosk http://www.page-to.display

```

Updated /etc/rc.local
```
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

# Print the IP address
_IP=$(hostname -I) || true
if [ "$_IP" ]; then
  printf "My IP address is %s\n" "$_IP"
fi

su - pi -c 'startx' &

exit 0
```