Pain in the ass to get setup.

### run vncserver
```
vncserver --geometry 1280x800
```

### Instructions
Setup gce and ubuntu with tightvncserver

https://medium.com/google-cloud/linux-gui-on-the-google-cloud-platform-800719ab27c5#.5mvzxm1qw

Install ubuntu desktop (ended up with unity) or ubuntu gnome desktop

```
apt-get install ubuntu-desktop -y
dpkg-reconfigure lightdm
gsettings set org.gnome.desktop.background show-desktop-icons true
```
or
```
apt-get install ubuntu-gnome-desktop -y
dpkg-reconfigure gdm
```

paste in `~/.vnc/xstartup` and chmod 755 just in case
```
#!/bin/sh
[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup
[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources
xsetroot -solid grey
vncconfig -iconic &
x-window-manager &

gnome-panel &
gnome-settings-daemon &
metacity &
nautilus -n &
gnome-terminal &
```

https://medium.com/@mikemetral/my-experience-upgrading-from-ubuntu-12-04-to-14-04-5e6fac849ea3#.l1zd4akmy
